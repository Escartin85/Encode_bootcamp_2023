// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

interface Isolution {
    function solution() external view returns (uint8);
}

contract Level_0 is Isolution{
    
    function solution() public pure override returns (uint8) {
        return 255;
    }
}