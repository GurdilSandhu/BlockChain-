// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Product_sell_buy{

    struct Product{
        string name;
        uint quantity;
        uint price;
    }

    mapping (uint=> Product) products;

    function addproduct(uint id, string memory name, uint quantity,uint price) public{
        products[id] = Product(name,quantity,price);
    }
    
    function buyproduct(uint id,uint quantity) public{
        require(products[id].quantity>=quantity,"Not enough");
        products[id].quantity-=quantity;
    }

    function getProductDetails(uint id) public view returns(string memory name, uint quantity, uint price){
        Product memory p = products[id];
        return(p.name,p.quantity,p.price); 
    }


}