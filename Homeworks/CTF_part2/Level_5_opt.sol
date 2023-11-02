pragma solidity 0.8.17;
// Using the Isolution5 interface calculate the average of two values int256 a and int256 b.

// You will need to write an overflow-free method that will round up the average of (a + b) / 2. 
// Keep in mind that we are rounding up (ceil) and NOT rounding down (floor). 
// Floor = rounding towards zero while Ceil = rounding away from zero see examples on wikipedia

interface Isolution5 {
    function solution(int256 a, int256 b) external pure returns (int256);
}

contract Level5Solution is Isolution5 {
    function solution(int256 a, int256 b) external pure override returns (int256) {
        assembly {
            // Calcula la suma de 'a' y 'b'
            let sum := add(a, b)
            // Obtiene el residuo de la división por 2
            let remainder := mod(sum, 2)

            // Calcula el promedio redondeando hacia arriba
            let avg := div(add(sum, mul(remainder, 2)), 2)

            // Devuelve el valor del promedio
            return(avg)
        }
    }
}