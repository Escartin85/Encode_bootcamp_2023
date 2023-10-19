// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryVariable {
    function addNumbers(uint256 a, uint256 b) public pure returns (uint256 result) {
        // Declare a memory variable
        uint256 sum;
        
        // Perform the addition
        sum = a + b;
        
        // Return the result
        return sum;
    }
}