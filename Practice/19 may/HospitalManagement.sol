// Blockchain Hospital Management System
// Create a smart contract named HospitalManagement.
// Patient Details
// patientId
// name
// disease
// doctorAssigned
// admitted
// billAmount
// Add patient
// Update disease
// Assign doctor
// Discharge patient
// Generate hospital bill
// Prevent updating discharged patient
// Count admitted patients
// Get patient details

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HospitalManagement {
    struct Patient {
        uint patientId;
        string name;
        string disease;
        string doctorAssigned;
        bool admitted;
        uint billAmount;
    }

    mapping (uint => Patient) public patients;
    mapping (uint => bool) public ispatientExist;
    uint public totalAdmittedPatients;
    uint public totalpatients;

    function addPatient(uint _patientId,string memory _name) public{
       require(ispatientExist[_patientId]==false,"Already Existed");
       totalpatients++;
       ispatientExist[_patientId] = true;
       patients[_patientId] = Patient(_patientId,_name,"","",false,500);
    }

    function updatePatientDisease(uint _patientId,string memory _disease) public{
       require(ispatientExist[_patientId]==true,"Not Existed");
       patients[_patientId].disease = _disease;
    }

     function admitPatient(uint _patientId) public{
       require(ispatientExist[_patientId]==true,"Not Existed");
       patients[_patientId].admitted = true;
       totalAdmittedPatients++;
       patients[_patientId].billAmount += 2000;
    }

    function assignDoctor(uint _patientId,string memory _doctor) public{
       require(ispatientExist[_patientId]==true,"Not Existed");
       patients[_patientId].doctorAssigned = _doctor;
       patients[_patientId].billAmount += 500;
    }

    function generateHospitalBill(uint _patientId) public view returns(string memory name, uint billAmount){
       require(ispatientExist[_patientId]==true,"Not Existed");
       Patient memory p = patients[_patientId];
        return (p.name, p.billAmount);
    }

    function discharge(uint _patientId) public{
       require(ispatientExist[_patientId]==true,"Not Existed");
       totalAdmittedPatients--;
       patients[_patientId].admitted = false;
    }
}
