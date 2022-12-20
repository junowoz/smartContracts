// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Coin {
    // The keyword "public" makes variables
    // accessible from other contracts
    address public minter;

    //Creates a public state variable named balances: Hash table
    mapping (address => uint) public balances;

    // Declares an “event”, which is emitted in the last line of the function send.
    // Events allow clients to react to specific contract changes you declare.
    // with ethersjs you can listen to events.
    event Sent(address from, address to, uint amount);

    // Constructor code is only run when the contract is created
    //msg.sender is a global variable which dictates the address where the external func call came from.
    constructor() {
        minter = msg.sender;
    }

    // Sends an amount of newly created coins to an address
    // Can only be called by the contract creator
    // Require call, defines conditions that reverts all changes if not met.
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    // Errors allow you to provide information about
    // why an operation failed. They are returned
    // to the caller of the function.
    error InsufficientBalance(uint requested, uint available);

    // Sends an amount of existing coins
    // from any caller to an address
    function send(address receiver, uint amount) public {
        if (amount > balances[msg.sender])
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}