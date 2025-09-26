// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract MyFirstContract {
    address public owner;
    mapping(address => uint256) public payments;

    constructor() {
        owner = msg.sender;
    }

    function payForItem() public payable {
        payments[msg.sender] += msg.value;
    }

    function withdrawAll() public {
        require(msg.sender == owner, "Not the owner");
        address payable _to = payable(owner);
        _to.transfer(address(this).balance);
    }
}
