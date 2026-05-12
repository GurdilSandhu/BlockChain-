// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//155202
contract sum_array{

    //4882
    uint[] public num;
    
    //27651
    function addElement(uint _num) public{
        num.push(_num);
    }
    
    //13523  //16292
    function addElements() public view returns(uint sum){
        sum = 0;
        uint length = num.length;
         for(uint8 i=0;i<length;i++){
              sum += num[i];
         }
         return sum;
    }
}