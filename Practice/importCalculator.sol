// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./exportCalculator.sol";

contract calculator{
    Calculator calcul;
    constructor(address linkAdress){
        calcul = Calculator(linkAdress);
    }

    function add(uint value) public{
        calcul.add(value);
    }

    function sub(uint value) public{
       calcul.sub(value);
    }

    function multi(uint value) public{
        calcul.multi(value);
    }

    function divide(uint value) public{
        calcul.divide(value);
    }

    function modulo(uint value) public{
        calcul.modulo(value);
    }

    function square(uint value) public{
        calcul.square(value);
    }

    function cube(uint value) public{
        calcul.cube(value);
    }

    function sqrt(uint value) public{
        calcul.sqrt(value);
}
    function Result() view public returns(uint){
       return calcul.SeeResult();
    }
}