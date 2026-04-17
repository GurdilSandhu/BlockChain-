// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IncreDecre{
     int public value = 0;

     function Increment() public returns(int){
        value++;
        return value;
     }

      function Decrement() public returns(int){
        value--;
        return value;
     }
}