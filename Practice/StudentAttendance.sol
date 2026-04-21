// Student Attendance Tracker
// Problem:

// Requirements:
// Mark attendance for a student
// Maintain count of attended classes

// Conditions:
// A student cannot be marked present more than once for the same session
// Attendance count should not exceed total sessions
// Invalid student entries should be rejected

// SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// contract StudentAttendance{
//     bool isPresent;
//     uint public Total_count;
//     uint CSEcount;
//     uint SCIcount;
//     uint SSTcount;
//     uint ITcount;
//     uint ENGcount;

//     function CSE(bool attend) public{
//         if(attend==true && CSEcount<1){
//             isPresent=true;
//             CSEcount++;
//             Total_count++;
//         }
//         isPresent = false;
//     }

//     function Science(bool attend) public{
//         if(attend==true && SCIcount<1){
//             isPresent=true;
//             SCIcount++;
//             Total_count++;
//         }
//         isPresent= false;
//     }

//     function SSt(bool attend) public{
//         if(attend==true && SSTcount<1){
//             isPresent=true;
//             SSTcount++;
//             Total_count++;
//         }
//         isPresent= false;
//     }

//     function IT(bool attend) public{
//         if(attend==true && ITcount<1){
//             isPresent=true;
//             ITcount++;
//             Total_count++;
//         }
//         isPresent= false;
//     }

//     function English(bool attend) public{
//         if(attend==true && ENGcount<1){
//             isPresent=true;
//             ENGcount++;
//             Total_count++;
//         }
//         isPresent= false;
//     }

// }

// 1. Student Marks Management System

// Requirements:

// Create a mapping to store student marks (address => uint)
// Maintain an array of student addresses
// Function to add marks:
// Use require to ensure marks are between 0–100
// Add student to array only if not already added
// Function to get all student addresses

// Expected Output:

// Stores marks securely
// Prevents invalid marks
// No duplicate student entries in array

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentManagement{
    mapping (address => uint) marks;
    address[] students;

    mapping (address => bool) isStudentAdded;

    function addMarks(uint value) public{
        require(value<=100 && value>=0,"Marks must be between 0 to 100");
        marks[msg.sender]+=value;

        if (!isStudentAdded[msg.sender]) {
            students.push(msg.sender);
            isStudentAdded[msg.sender] = true;
        }
    }

    function getAll() public view returns(address[] memory){
        return students;
    }
    
    function checkmarks() public view returns(uint){
        return marks[msg.sender];
    }
    
}