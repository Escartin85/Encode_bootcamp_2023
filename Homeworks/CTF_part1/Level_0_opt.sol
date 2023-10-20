// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

interface Isolution {
    function solution() external view returns (uint8);
}

contract Level_0 is Isolution{
    
    function solution() public pure override returns (uint8) {
        assembly {
            // Store the value 255 in the position of the memory0
            mstore(0, 255)  
            // Return the value stored in the positio of the memory 0 (32 bytes)
            return(0, 32)   
        }
    }
}