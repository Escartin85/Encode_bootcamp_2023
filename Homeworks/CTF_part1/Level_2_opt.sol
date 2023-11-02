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
        assembly {
            let pivot := mload(add(add(arr, 0x20), mul(right, 0x20)))
            let i := sub(left, 1)

            for { let j := left } lt(j, right) { j := add(j, 1) } {
                let currentValue := mload(add(add(arr, 0x20), mul(j, 0x20)))
                if iszero(gt(pivot, currentValue)) {
                    i := add(i, 1)
                    mstore(0x0, mload(add(add(arr, 0x20), mul(i, 0x20))))
                    mstore(add(add(arr, 0x20), mul(i, 0x20)), currentValue)
                    mstore(add(add(arr, 0x20), mul(j, 0x20)), mload(0x0))
                }
            }
            i := add(i, 1)
            mstore(0x0, mload(add(add(arr, 0x20), mul(i, 0x20))))
            mstore(add(add(arr, 0x20), mul(i, 0x20)), pivot)
            mstore(add(add(arr, 0x20), mul(right, 0x20)), mload(0x0))
            mstore(0x0, i)
        }
        return 0x0
    }
}
