// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Voting{
    address Owner;

  struct Proposal{
    string title;
    uint id;
    uint votecount;
    address proposedby;
    mapping(address=>voter) voters;
  }
  
  mapping(uint =>Proposal) Proposals;
  
  struct voter{
    bool voted;
  } 
  
  uint count =0;
  event Proposalcreated(address  indexed creator);
  event Vote(address  indexed Voter);
  
  modifier onlyowner{
      require(msg.sender == Owner,"Only owner can add the proposal");
      _;
  }
  constructor ()  {
      Owner = msg.sender;
  }
  function addproposal(string memory _title) public  onlyowner{
    Proposal storage p  = Proposals[count];

    p.title = _title;
    p.votecount = 0;
    p.proposedby = msg.sender;
    p.id = count;
    count++;

    emit Proposalcreated(msg.sender);

  }
  function gettotalProposal() public view returns(uint ){
       return count;
  }
  function getProposal( uint id) public view returns(string memory title , uint Id, uint votecount, address proposedby ){
      Proposal storage p = Proposals[id];
      return(p.title, p.id, p.votecount, p.proposedby); 
  }
  
  function vote(uint id) public{
    require(!Proposals[id].voters[msg.sender].voted,"Already voted" );
    require(Proposals[id].proposedby != address(0),"Not registered" );
    Proposals[id].votecount += 1;
    Proposals[id].voters[msg.sender].voted = true;
    emit Vote(msg.sender);
  }
  
  function hasvoted(uint256 proposalId, address voterAddress) public view returns (bool)
  {
     Proposal storage p = Proposals[proposalId];
        return p.voters[voterAddress].voted;
    


  }
}