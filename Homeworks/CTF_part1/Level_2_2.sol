// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

interface Isolution2 {
  function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray);
}

contract Level_2 is Isolution2 {

    function solution(uint256[10] calldata unsortedArray) external pure override returns (uint256[10] memory sortedArray) {
        uint256[10] memory sortedA = unsortedArray;
        uint n = sortedA.length;
        for (uint i = 0; i < n - 1; i++) {
            for (uint j = 0; j < n - i - 1; j++) {
                if (sortedA[j] > sortedA[j + 1]) {
                    (sortedA[j], sortedA[j + 1]) = (sortedA[j + 1], sortedA[j]);
                }
            }
        }
        return sortedA;
    }
}