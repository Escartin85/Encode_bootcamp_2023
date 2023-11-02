// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

interface Isolution3 {
    function solution(bytes memory packed) external returns (uint16 a, bool b, bytes6 c);
}

contract Level_3 is Isolution3 {
    function solution(bytes memory packed) public pure override returns (uint16 a, bool b, bytes6 c) {
        require(packed.length >= 4 + 1 + 6, "Packed data too short");

        assembly {
            let dataPointer := add(packed, 0x20) // Puntero a los datos en memoria

            // Extraer los valores de los bytes en la memoria
            let valueA := mload(dataPointer)
            let valueB := shr(248, mload(add(dataPointer, 0x2)))
            let valueC := mload(add(dataPointer, 0x3))

            // Asignar valores a las variables de salida
            a := shr(240, valueA) // Obtener los primeros 16 bits
            b := iszero(iszero(valueB)) // Convertir a un booleano
            c := valueC
        }
    }
}
