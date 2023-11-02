pragma solidity ^0.8.4;

contract SubOverflow {
    // Modify this function so that on overflow it returns the value 0
    // otherwise it should return x - y
    function subtract(uint256 x, uint256 y) public pure returns (uint256) {
        // Write assembly code that handles overflows
        assembly {
            if sub(x, y){
                mstore(0, 0)  // Set memory at position 0 to 0 in case of underflow
            }else {
                res := sub(x,y)
                mstore(0, res)
            }
            return(0, 0x20)  // Return a 32-byte slice from position 0 in memory
        }
    }
}

