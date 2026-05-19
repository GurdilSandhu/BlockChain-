// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract struct_2nd{


struct product{
    uint id;
    string name;
    bool expired;
}



product[] public products;
product public  products1;

function changeProduct(uint _id,string memory _name, bool _expired) public{
    product memory new_product = product({
        id: _id,
        name: _name,
        expired: _expired
    });
    products1 = new_product;
}

function addproduct(uint id, string memory name, bool expired) public{
   products1 =  product(id,name,expired);
}

function getproduct() view public returns(product memory){
     return products1;
}

function alwaysAvailable() public{
   products.push(product(1,"sam",true));
}

function add_products(uint id, string memory name, bool expired) public{
   products.push(product(id,name,expired));
}

}