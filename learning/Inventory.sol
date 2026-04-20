// Inventory Management System
// Problem:

// Create a contract to manage warehouse inventory.

// Requirements:
// Add stock
// Remove stock
// Track total available items
// Conditions:

// Cannot add zero items
// Cannot remove more items than available
// Inventory should never become negative


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Inventory{

    uint public Total_available_items;

    function AddStock(uint items) public{
        // Cannot add zero items
        require(items>0,"Insufficient Items");

        Total_available_items+=items;

    }

    function RemoveItems(uint items) public{
        // Cannot remove more items than available
        if(Total_available_items<0 || Total_available_items<items){  
            revert("More or less Items than in inventory");
        }
        Total_available_items-=items;

        assert(Total_available_items>=0);//never become negative
    }
}