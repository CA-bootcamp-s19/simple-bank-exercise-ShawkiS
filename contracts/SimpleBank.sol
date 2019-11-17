/*
    This exercise has been updated to use Solidity version 0.5
    Breaking changes from 0.4 to 0.5 can be found here: 
    https://solidity.readthedocs.io/en/v0.5.0/050-breaking-changes.html
*/
pragma solidity ^0.5.0;

contract SimpleBank {

    mapping (address => uint) private balances;
    mapping (address => bool) public enrolled;



    address owner;
    
    event LogEnrolled(address accountAddress);
    event LogDepositMade(address accountAddress, uint256 amount);
    event LogWithdrawal(address accountAddress, uint256 withdrawAmount,uint256 newBalance);

    constructor() public {
        owner = msg.sender;
    }

    function() external payable {
        revert();
    }

    function isEnrolled(address add) public view returns (bool) {
        return enrolled[add];
    }

    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    function enroll() public returns (bool){
       return enrolled[msg.sender] = true;
    }

    function deposit() public payable returns (uint) {

        balances[msg.sender] += msg.value;
        emit LogDepositMade(msg.sender, msg.value);
        return balances[msg.sender];
    }

    function withdraw(uint withdrawAmount) public returns (uint) {
        require(balances[msg.sender] >= withdrawAmount, "the withdraw amount is bigger");
        balances[msg.sender] -= withdrawAmount;
        emit LogWithdrawal(msg.sender, withdrawAmount, balances[msg.sender]);
        return balances[msg.sender];
    }

}
