pragma solidity ^0.8.24;

import "hardhat/console.sol";
import "./Storage.sol";

contract A {
    function setA(uint256 _a) public {
        AppStorage storage s = Storage.get();
        s.a = _a;
    }

    function getA() public view returns (uint256) {
        AppStorage storage s = Storage.get();
        return s.a;
    }
}

contract B {
    constructor(address _ContractA) {
        AppStorage storage s = Storage.get();
        s.ContractA = _ContractA;
        s.b = 1;
        s.c = 0x45;
        s.d = 0xF5;
    }

    function setB(uint _b) public {
        AppStorage storage s = Storage.get();
        s.b = _b;
        s.ContractA.delegatecall(
            abi.encodeWithSignature("setA(uint256)", _b + 1)
        );
    }

    function getB() public view returns (uint) {
        AppStorage storage s = Storage.get();
        return s.b;
    }
}
