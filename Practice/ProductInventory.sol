// 5. Product Inventory System

// Requirements:

// Array of product IDs
// Mapping for product stock (productId => quantity)
// Function to add product:
// Use require to ensure product doesn't already exist
// Function to buy product:
// Use require to check stock availability

// Expected Output:

// No duplicate product IDs
// Stock reduces after purchase
// Cannot buy out-of-stock product

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Product_Inventory{
    uint[] productID;
    mapping (uint => uint) product_stock;
    mapping (uint => bool) isExisted;

    function addProductID(uint id,uint quantity) public{
        require(!isExisted[id],"Id already exist");
       
        productID.push(id);
        product_stock[id]=quantity;
        isExisted[id]=true;
    }

    function buyProduct(uint id, uint quantity) public{
        require(isExisted[id],"Invalid Id");
        require(product_stock[id]>=quantity,"Invalid quantity");
     
        product_stock[id]-=quantity;
    }

     function getFullDetails() public view returns (uint[] memory, uint[] memory) {
        uint[] memory all_products=new uint[](productID.length);
        for (uint i = 0; i < productID.length; i++) {
            all_products[i]= product_stock[productID[i]];
        }

        return (productID, all_products);
    }
}