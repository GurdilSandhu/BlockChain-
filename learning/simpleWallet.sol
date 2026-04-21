// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Wallet {
    mapping(address => uint) public balance;

    function deposit(uint value) public {
        balance[msg.sender] += value;
    }

    function withdraw(uint value) public{
        require(balance[msg.sender]>value,"insufficient balance");
        balance[msg.sender] -= value;
    }

    function checkBalance() public view returns(uint){
        return balance[msg.sender];
    }
}
