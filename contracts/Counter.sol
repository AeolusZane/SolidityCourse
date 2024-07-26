pragma solidity ^0.8.24;

import "hardhat/console.sol";

contract Counter {
    uint counter;

    function count() public {
        counter++;
        console.log("Now, counter is: ", counter);
    }

    function getCount() public view returns (uint) {
        return counter;
    }
}
