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
pragma solidity ^0.8.0;

contract StudentAttendance{
    bool isPresent;
    uint public Total_count;
    uint CSEcount;
    uint SCIcount;
    uint SSTcount;
    uint ITcount;
    uint ENGcount;

    function CSE(bool attend) public{
        if(attend==true && CSEcount<1){
            isPresent=true;
            CSEcount++;
            Total_count++;
        }
        isPresent = false;
    }

    function Science(bool attend) public{
        if(attend==true && SCIcount<1){
            isPresent=true;
            SCIcount++;
            Total_count++;
        }
        isPresent= false;
    }

    function SSt(bool attend) public{
        if(attend==true && SSTcount<1){
            isPresent=true;
            SSTcount++;
            Total_count++;
        }
        isPresent= false;
    }

    function IT(bool attend) public{
        if(attend==true && ITcount<1){
            isPresent=true;
            ITcount++;
            Total_count++;
        }
        isPresent= false;
    }

    function English(bool attend) public{
        if(attend==true && ENGcount<1){
            isPresent=true;
            ENGcount++;
            Total_count++;
        }
        isPresent= false;
    }

}