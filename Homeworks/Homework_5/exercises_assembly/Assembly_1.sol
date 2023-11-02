pragma solidity ^0.8.4;

contract Intro {
    function intro() public pure returns (uint16) {
        uint256 mol = 420;

        // Yul assembly magic happens within assembly{} section
        assembly {
            // stack variables are instantiated with
            // let variable_name := VALßUE
            // instantiate a stack variable that holds the value of mol
            // To return it needs to be stored in memory
            // with command mstore(MEMORY_LOCATION, STACK_VARIABLE)
            // to return you need to specify address and the size from the starting point
            
            // Store the value of 'mol' in memory at position 0x00
            mstore(0, mol)

            // Return the value from memory and specify the size
            // 0x20 is the size of a uint256 in bytes
            retunr(0, 0x20)
        }
    }
}