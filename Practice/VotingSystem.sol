// 2. Voting System

// Requirements:

// Mapping to track if a user has voted (address => bool)
// Array to store candidates
// Mapping for vote count (candidate => uint)
// Function to vote:
// Use require to ensure user votes only once
// Candidate must exist (validate using array)

// Expected Output:

// Each address votes only once
// Vote count increases correctly
// Invalid candidates rejected

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract votingSystem{
    mapping(address => bool) isVoted;
    string[] candidates;
    mapping(string => uint) voteCount;

    function addCandidate(string memory name) public{
        require(bytes(name).length>0,"name can not be empty");
        candidates.push(name);
    }

    function addVote(uint candidate) public{
        require(!isVoted[msg.sender],"vote only once");
        require(candidate<candidates.length,"invalid candidate");
        
        string memory candidateName = candidates[candidate];
        voteCount[candidateName] += 1;
        isVoted[msg.sender]= true;
    }

     function getCandidate(uint256 index) public view returns (string memory, uint256) {
        require(index < candidates.length, "Invalid candidate index");
        string memory name = candidates[index];
        return (name, voteCount[name]);
    }


}