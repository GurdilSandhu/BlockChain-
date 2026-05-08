



// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract createConstant{
    //2511 gas
    address public myName= 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    //356 gas
    address public constant Names = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; 

    //2522 gas using local variable 2895 gas
    function getConst(uint num) public view returns(address, uint){
        return (myName, num);
    }
    
    //364 gas using local var 762 gas
    function getConst1(uint num) public pure returns(address, uint){
        return (Names, num);
    }
}