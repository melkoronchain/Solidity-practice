# Solidity Practice 👨‍💻

This repository contains my first steps in **Solidity development**.  
I’m learning how to write, deploy and test smart contracts using [Remix IDE](https://remix.ethereum.org/).

---

## 📌 My First Contract

This is a very simple contract that helped me understand the basics of Solidity:

- How to declare a contract and variables  
- How to use `mapping` to store data  
- How to accept payments with `payable`  
- How to restrict access with `require`  

```solidity
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
```

  What I Learned
- How the `constructor` sets the contract owner
- How `msg.sender` and `msg.value` work
- How to use `mapping` to track payments
- How to restrict access with `require`
- How to transfer Ether from the contract to the owner


📝 License  
This project is licensed under the MIT License.
