// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

interface Isolution2 {
  function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray);
}

contract Level_2 is Isolution2 {

    function solution(uint256[10] calldata unsortedArray) external pure override returns (uint256[10] memory sortedArray) {
            if (unsortedArray.length <= 1) {
                return unsortedArray;
            }

            quickSort(unsortedArray, 0, int(unsortedArray.length - 1));
            return unsortedArray;
    }

    function quickSort(uint256[10] memory arr, int left, int right) internal pure {
        if (left < right) {
            int pivotIndex = partition(arr, left, right);
            quickSort(arr, left, pivotIndex - 1);
            quickSort(arr, pivotIndex + 1, right);
        }
    }

    function partition(uint256[10] memory arr, int left, int right) internal pure returns (int) {
        uint256 pivot = arr[uint(right)];
        int i = left - 1;
        for (int j = left; j < right; j++) {
            if (arr[uint(j)] <= pivot) {
                i++;
                (arr[uint(i)], arr[uint(j)]) = (arr[uint(j)], arr[uint(i)]);
            }
        }
        (arr[uint(i + 1)], arr[uint(right)]) = (arr[uint(right)], arr[uint(i + 1)]);
        return i + 1;
    }
}