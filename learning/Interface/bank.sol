// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract bank{

    mapping (address => uint) balances;

    function deposit() external payable {
         require(msg.value > 0,"add some funds");
         balances[msg.sender] += msg.value;
    }

    function getMyBalance() external view returns(uint){
        return balances[msg.sender];
    }

    function withdraw(uint amount) external payable{
        require(balances[msg.sender] >= amount ,"No Funds");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}