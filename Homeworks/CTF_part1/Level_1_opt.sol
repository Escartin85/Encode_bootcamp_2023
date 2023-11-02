// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

interface Isolution1 {
    function solution(
        uint256[2][3] calldata x, 
        uint256[2][3] calldata y
    ) external pure returns (
        uint256[2][3] memory
    );
}

contract Level_1 is Isolution1 {

    function solution(
        uint256[2][3] calldata x, 
        uint256[2][3] calldata y
    ) public pure override returns (uint256[2][3] memory) {
        uint256[2][3] memory result;

        assembly {
            // Encabezado: Definición de las variables de memoria
            // La posición de la variable de memoria `x` es 0x40
            // La posición de la variable de memoria `y` es 0x140
            // La posición de la variable de memoria `result` es 0x240
            // La posición de la variable de memoria temporal es 0x340
            let ptr := mload(0x40)
            mstore(ptr, mload(x))
            mstore(add(ptr, 0x20), mload(add(x, 0x20)))
            mstore(add(ptr, 0x40), mload(add(x, 0x40)))

            let ptr_y := mload(0x140)
            mstore(ptr_y, mload(y))
            mstore(add(ptr_y, 0x20), mload(add(y, 0x20)))
            mstore(add(ptr_y, 0x40), mload(add(y, 0x40)))

            let ptr_res := mload(0x240)

            // Suma de las matrices x e y y almacenamiento en result
            for { let i := 0 } lt(i, 3) { i := add(i, 1) } {
                for { let j := 0 } lt(j, 2) { j := add(j, 1) } {
                    mstore(add(ptr_res, mul(0x20, add(i, j))), add(mload(add(ptr, mul(0x20, add(i, j)))), mload(add(ptr_y, mul(0x20, add(i, j)))))
                    )
                }
            }

            // Devolver result
            mstore(0x0, ptr_res)
            return(0x0, 0xC0)
        }
    }
}
