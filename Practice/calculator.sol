// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Calculator{

    uint public result;

    event Calculation(string operation, uint value, uint result);

    function setValue(uint _value) public{
        result = _value;
        emit  Calculation("SET", _value, result);
    }
}