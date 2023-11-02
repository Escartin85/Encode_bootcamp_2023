// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_0 {
    function solution() public pure returns (uint8) {
        assembly {
            // Retorna directamente el valor 255
            // Se utiliza la instrucción `return` de ensamblador
            return(255)
        }
    }
}