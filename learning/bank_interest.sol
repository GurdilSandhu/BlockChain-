// Create a Bank Account smart contract where:
// User can store account details
// One function should only read account data and calculate interest using memory
// Another function should update account balance using storage

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank_Account{
    
    struct Account_Details{
        string Uname;
        address Uaddress;
        uint balance;
        uint interest;
    }

    mapping (address => Account_Details) public users;

    function addAccount(string memory name, uint interest) public payable {
        require(msg.value>0,"Deposit some amount!!");
        require(msg.sender != users[msg.sender].Uaddress,"already exist");
        users[msg.sender] = Account_Details(name, msg.sender, msg.value , interest);
    }

    function deposit()public payable {
        require(msg.sender == users[msg.sender].Uaddress,"Not exist");
        require(msg.value>0,"Deposit some amount!!");
        users[msg.sender].balance += msg.value;
    }


    function updateAccount() public {
         require(msg.sender == users[msg.sender].Uaddress,"Command Rejected");
        Account_Details storage user = users[msg.sender];
        user.balance += (user.balance * user.interest) / 100;
    }

     function getDetails() public view returns (string memory Uname, uint balance, uint interest) {
        Account_Details memory user = users[msg.sender];
        return (user.Uname, user.balance , user.interest);
    }

    function withdraw(uint amount) public payable{
        users[msg.sender].balance -= amount;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
    }
}