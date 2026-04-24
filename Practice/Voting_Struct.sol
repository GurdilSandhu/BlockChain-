// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting_Struct{
    address owner;
    constructor(){
        owner=msg.sender;
    }
    modifier checkOwner{
        require(owner==msg.sender,"Access Denied");
        _;
    }
    
    //parties
    struct Party{
        uint id;
        string name;
        uint voteCount;
    }
    mapping (uint => Party) parties;
    mapping (uint => bool) isPartyExist;
    uint[] allPartyIds;

    function addParty(uint id, string memory name) public checkOwner{
        require(!isPartyExist[id],"Party already existed");
        allPartyIds.push(id);
        isPartyExist[id]=true;
        parties[id] = Party(id,name,0);
    }

    //Voters
     struct Voter{
        uint id;
        string name;
        bool isVoted;
        address wallet;
    }    
    mapping (uint => Voter) Voters;
    mapping (uint => bool) isVoterExisted;
    mapping (address => bool) hasRegistered;
    mapping (address => bool) hasVoted;
    uint[] allVoters;

    function addVoter(uint id, string memory name) public{
        require(!isVoterExisted[id],"Voter already existed");
        require(!hasRegistered[msg.sender], "Voter already existed");
        allVoters.push(id);
        isVoterExisted[id]=true;
        hasRegistered[msg.sender]=true;
        Voters[id] = Voter(id,name,false,msg.sender);
    }

    //Voting
    function vote(uint partyId) public {
        require(hasRegistered[msg.sender], "Not registered as voter");
        require(!hasVoted[msg.sender], "Already voted");
        require(isPartyExist[partyId], "Invalid party");

        parties[partyId].voteCount++;
        hasVoted[msg.sender] = true;
    }

    //getVotingDetails
     function getPartyVotes(uint partyId) public view returns (string memory, uint){
        require(isPartyExist[partyId], "Party not found");

        Party memory p = parties[partyId];
        return (p.name, p.voteCount);
    }

}