// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 import "./currencyConversion.sol";

contract UserContract {
    currencyConversion converting;

    constructor(address conversionAddress) {
        converting = currencyConversion(conversionAddress);
    }

    function convert(string memory currency, uint amount) external view returns (uint) {
        return converting.convert(currency, amount); 
    } 
}