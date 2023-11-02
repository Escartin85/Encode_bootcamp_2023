pragma solidity ^0.8.4;

contract Add {
    function addAssembly(uint256 x, uint256 y) public pure returns (uint256) {
        // Intermediate variables can't communicate between  assembly blocks
        // But they can be written to memory in one block
        // and retrieved in another.
        // Fix this code using memory to store the result between the blocks
        // and return the result from the second block
        assembly {
            let result := add(x, y)
            // Store the value of 'result' in memory at position 0x00
            mstore(0, result)
        }

        assembly {
            // Retrieve the result from memory and return it
            // 0x20 is the size of a uint256 in bytes
            return(0, 0x20)
        }
    }
}