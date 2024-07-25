pragma solidity ^0.8.24;

import "hardhat/console.sol";

contract Counter {
    uint counter;

    function count() public returns (uint) {
        counter++;
        console.log("Now, counter is: ", counter);
        return counter;
    }
}
