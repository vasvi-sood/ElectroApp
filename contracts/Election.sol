pragma solidity ^0.5.0;


contract Election {
	struct Candidate {
		uint id;
		string name;
		uint votecount;
	
	}
	 mapping(address => bool) public voters;
mapping (uint => Candidate) public candidates;
uint public candidateCount;
 event votedEvent (
        uint indexed _candidateId
    );
  constructor() public {
   addCandidate("Candidate 1");
   addCandidate("Candidate 2");
  }
  function addCandidate (string memory _name)  private {
  	candidateCount++;
  	candidates[candidateCount]=Candidate(candidateCount,_name,0);

  }
 function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidateCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].votecount ++;

        // trigger voted event
        emit votedEvent(_candidateId);
    }
 
}
