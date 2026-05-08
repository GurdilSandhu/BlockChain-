// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./enum.sol";

contract Amazon_Order{
     
     createEnum.AmazonStatus public status;


      function setStatus() public{
        status = createEnum.AmazonStatus.Shiped;
    }

    function getStatus() public view returns(createEnum.AmazonStatus){
        return (status);
    }

}