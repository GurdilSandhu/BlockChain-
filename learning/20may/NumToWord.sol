// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HundredToWord{
    string[20] units = ["Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Eleven","Twelve","Thirteen","Fourteen","Fifteen","Sixteen","Seventeen","Eighteen","Nineteen"];
    string[10] tens = ["","","Twenty","Thirty","Forty","Fifty","Sixty","Seventy","Eighty","Ninety"];

    function NumToWord_rupees(uint num)public view returns(string memory){
        require(num <= 100, "Only numbers from 0 to 100 allowed");

        // 0 - 19
        if (num < 20) {
            return string(abi.encodePacked(units[num]," ","Rupees"));
        }

        // 100
        if (num == 100) {
            return "One Hundred";
        }

        // 20 - 99
        uint256 t = num / 10;
        uint256 u = num % 10;

        if (u == 0) {
            return string(abi.encodePacked(tens[t]," ","Rupees"));
        }
            return string(abi.encodePacked(tens[t], " ", units[u]," ","Rupees"));
}
}