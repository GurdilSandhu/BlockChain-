// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract currencyConversion{
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    mapping(string => uint) public rates;

    function setRate(string memory currency, uint rate) external onlyOwner {
        rates[currency] = rate;
    }

    function convert(string memory currency, uint amount) external view returns (uint) {
        uint rate = rates[currency];
        require(rate > 0, "Rate not set");

        return amount * rate; 
    } 
}