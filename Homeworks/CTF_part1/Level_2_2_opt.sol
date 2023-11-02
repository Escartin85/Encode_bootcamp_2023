pragma solidity 0.8.17;

interface Isolution2 {
    function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray);
}

contract Level_2 is Isolution2 {
    function solution(uint256[10] calldata unsortedArray) external pure override returns (uint256[10] memory sortedArray) {
        uint256[10] memory sortedA;

        assembly {
            // Copiar el array no ordenado al array 'sortedA'
            let ptr_sortedA := mload(0x40)
            for { let i := 0 } lt(i, 10) { i := add(i, 1) } {
                mstore(add(ptr_sortedA, mul(add(i, 1), 0x20)), mload(add(unsortedArray, mul(add(i, 1), 0x20))))
            }

            // Ordenar el array con el algoritmo Bubble Sort
            let n := 10
            for { let i := 0 } lt(i, sub(n, 1)) { i := add(i, 1) } {
                for { let j := 0 } lt(j, sub(n, i)) { j := add(j, 1) } {
                    let currentValue := mload(add(ptr_sortedA, mul(add(j, 1), 0x20)))
                    let prevValue := mload(add(ptr_sortedA, mul(j, 0x20)))
                    if gt(prevValue, currentValue) {
                        mstore(add(ptr_sortedA, mul(j, 0x20)), currentValue)
                        mstore(add(ptr_sortedA, mul(add(j, 1), 0x20)), prevValue)
                    }
                }
            }

            // Devolver el array ordenado
            mstore(0x0, ptr_sortedA)
            return(0x0, 0xC0)
        }
    }
}
