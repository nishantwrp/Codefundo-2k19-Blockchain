pragma solidity >=0.4.25 <0.6.0;

contract LetsVote
{
    enum StateType {ForApproval,Approved,Rejected,Voted}

    address public InstanceOwner;
    string public Aadhar;
    StateType public State;
    string public Voted;

    constructor(string memory aadhar) public
    {
        InstanceOwner = msg.sender;
        Voted = "false";
        Aadhar = aadhar;
        State = StateType.ForApproval;
    }

    function Approve() public
    {
        if (State != StateType.ForApproval)
        {
            revert();
        }
        State = StateType.Approved;
    }

    function Reject() public
    {
        if ( State != StateType.ForApproval )
        {
            revert();
        }
        State = StateType.Rejected;
    }

    function MarkVoted() public
    {
        if ( State != StateType.Approved )
        {
            revert();
        }
        Voted = "true";
        State = StateType.Voted;
    }
}