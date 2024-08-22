pragma solidity ^0.8.24;

struct AppStorage {
    uint8 c;
    uint8 d;
    uint256 a;
    uint b;
    address ContractA;
}

library Storage {
    bytes32 constant KEY = keccak256("storage-local");
    function get() internal pure returns (AppStorage storage s) {
        bytes32 loc = KEY;
        assembly {
            s.slot := loc
        }
    }
}
