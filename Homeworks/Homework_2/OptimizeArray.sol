// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Homework_2 {
    
    uint[] public numbers = [0,1,2,3,4,5,6,7,8,9,10,11];
    uint[] public numbers_2 = [0,1,2,3,4,5,6,7,8,9,10,11];
    uint gasUsed = 0;
    uint gasUsed_2 = 0;

    function delete1_ramdon_item_1(uint _item) public {
        uint numbersLenght = numbers.length;

        //require(_item < numbers.length);
        uint[] memory newArray = new uint[](numbersLenght - 1);
        uint newIndex = 0;
        uint index = 0;
        for (index; index < numbersLenght; index++) {
            if(numbers[index] != _item){
                newArray[newIndex] = numbers[index];
                newIndex++;
            }
        }
        numbers = newArray;
    }

    function delete2_ramdon_item_2(uint _item) public {
        uint numbers2Lenght = numbers_2.length - 1;
        uint index = 0;
        for (index; index < numbers2Lenght; index++) {
            if(numbers_2[index] == _item){
                //delete numbers_2[index];
                uint newIndex = index;
                for (newIndex; newIndex < numbers2Lenght; newIndex++) {
                    numbers_2[newIndex] = numbers_2[(newIndex + 1)];
                }
                numbers_2.pop();
                break;
            }
        }
    }

    function test1() public {
        uint256 startGas = gasleft();
        gasUsed = 0;
        delete1_ramdon_item_1(8);
        delete1_ramdon_item_1(2);
        delete1_ramdon_item_1(7);
        gasUsed = startGas - gasleft();
    }

    function test2() public {
        gasUsed_2 = 0;
        uint256 startGas = gasleft();
        delete2_ramdon_item_2(7);
        gasUsed_2 = startGas - gasleft();
    }

    function retornarArray1() public view returns (uint[] memory) {
        return numbers;
    }

    function retornarArray2() public view returns (uint[] memory) {
        return numbers_2;
    }

    function getLenght1() public view returns (uint) {
        return numbers.length;
    }

    function getLenght2() public view returns (uint) {
        return numbers_2.length;
    }

    function test_gasUsed_1() public view returns (uint) {
        return gasUsed;
    }

    function test_gasUsed_2() public view returns (uint) {
        return gasUsed_2;
    }
}