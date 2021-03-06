pragma solidity ^0.4.8;

contract IMiniMeToken {
	function transfer(address _to, uint256 _amount) public returns (bool success);
	function transferFrom(address _from, address _to, uint256 _amount) public returns (bool success);
	function balanceOf(address _owner) constant public returns (uint256 balance);
	function generateTokens(address _owner, uint _amount) public;
}
