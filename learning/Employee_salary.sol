// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Employee_Salary{
    uint empId;
    struct Emp{
       string name;
       uint salary;
       uint increment;
       uint Pf;
       uint Tds;
    }

    mapping (uint => Emp) employees;

    function setSalary(string memory _name, uint _salary, uint increment) public{
        empId++;
        employees[empId] = Emp(_name, _salary + increment, increment , 0, 0);
    }

    function getDetails(uint _id) public view returns(string memory,uint,uint,uint){
        Emp memory emp = employees[_id];
        uint bonus = (emp.salary * 5)/100;
        uint HRA = (emp.salary * 40)/100;
        return (emp.name,emp.salary,bonus,HRA);
    }
    
    //13488 with storage or memory
    function deduction(uint _id) public{
        Emp memory emp = employees[_id];
        emp.Pf = (emp.salary*12)/100;
        emp.Tds = (emp.salary*7)/100;

        employees[_id] = Emp(emp.name,emp.salary - (emp.Pf + emp.Tds), emp.increment, emp.Pf, emp.Tds);
    }
}