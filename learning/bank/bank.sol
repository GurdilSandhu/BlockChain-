// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankAccount {

    struct Account {
        string name;
        uint balance;
    }

    mapping(address => Account) public accounts;

    // Create Account
    function createAccount(string memory _name) public payable {

        accounts[msg.sender] = Account(_name, msg.value);
    }

 
    function getDetails() public view returns(string memory, uint, uint) {

        Account memory acc = accounts[msg.sender];

        uint interest = (acc.balance * 5) / 100;

        return (acc.name, acc.balance, interest);
    }

    
    function deposit() public payable {

        Account storage acc = accounts[msg.sender];

        acc.balance += msg.value;
    }

    // STORAGE Example
    // Permanently adds interest to balance
    function addInterest() public {

        Account storage acc = accounts[msg.sender];

        uint interest = (acc.balance * 5) / 100;

        acc.balance += interest;
    }
}