pragma solidity ^0.8.24;

import "hardhat/console.sol";

contract A {
    uint a;

    function setA(uint _a) public {
        a = _a;
    }

    function getA() public view returns (uint) {
        return a;
    }
}

contract B {
    address ContractA;
    uint b;
    constructor(address _ContractA) {
        ContractA = _ContractA;
    }

    function setB(uint _b) public {
        b = _b;
        ContractA.delegatecall(
            abi.encodeWithSignature("setA(uint)", _b + 1)
        );
    }

    function getB() public view returns (uint) {
        return b;
    }
}
