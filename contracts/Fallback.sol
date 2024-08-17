pragma solidity ^0.8.24;

import "hardhat/console.sol";

interface IFallback {
	function count() external;
}

contract Fallback {
	function foo() internal view {
		console.log("hello world");
	}
	
	fallback() external payable {
		foo();
		console.log("fallback");
		
		revert("shouldn' be there!");
	}
}