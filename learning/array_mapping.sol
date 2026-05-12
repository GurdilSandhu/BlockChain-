// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingExample {
    mapping(address => bool) public users;

    function addUser(address user) public {
        users[user] = true;
    }
}


// contract ArrayExample {
//     address[] public users;

//     function addUser(address user) public {
//         users.push(user);
//     }
// }