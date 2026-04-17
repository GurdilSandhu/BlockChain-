// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Calculator{

    int public result;

    event Calculation(string operation, int value, int result);

    function Addvalue(int _value) public{
        result += _value;
        emit Calculation("ADD", _value, result);
    }

    function Multiplyvalue(int _value) public{
        result *= _value;
        emit Calculation("MULTI", _value, result);
    }

    function Dividevalue(int _value) public{
        result/= _value;
        emit Calculation("DIV", _value, result);
    }

    function Subvalue(int _value) public{
        result-= _value;
        emit Calculation("SUB", _value, result);
    }
} 