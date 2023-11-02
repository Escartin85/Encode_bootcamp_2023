pragma solidity 0.8.17;

interface Isolution4 {
    function solution(uint256 number) external pure returns (uint256);
}

contract Level4Solution is Isolution4 {
    function solution(uint256 number) external pure override returns (uint256) {
        if (number == 0) {
            return 0;
        }

        assembly {
            let result := 1

            // Iteración para encontrar el mayor exponente de 2
            // Se utiliza desplazamiento a la derecha
            // while (number > 1) { number = number >> 1; result = result << 1; }
            for { } gt(number, 1) { } {
                number := shr(1, number)
                result := shl(1, result)
            }

            // Devolver el resultado
            return(result)
        }
    }
}
