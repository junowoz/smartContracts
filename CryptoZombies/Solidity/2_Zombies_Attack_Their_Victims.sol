//Chapter 2: Mappings and Addresses: 2 Datatypes
// Ethereum Blockchain -> accounts -> address [unique identifier, owned by an user, or Smart Contract]
// Mappings: Like Structs and Arrays, are aother way of storing data.

mapping (uint => address)public zombieToOwner;
mapping (address => uint) ownerZombieCount;

//Chapter 3: Msg.sender
msg.sender //Refers to the person (or smart contract) who called the current function. There will always be a msg.sender.
zombieToOwner[id] = msg.sender;
ownerZombieCount[msg.sender]++;

//Chapter 4: Require -> If not true, stop function. Verify if certain conditions are true.
require (ownerZombieCount[msg.sender] == 0);

//Chapter 5: Inheritance -> Create various contracts to split the code.
contract ZombieFeeding is ZombieFactory { }

//Chapter 6: Import
import "./zombiefactory.sol";

//Chapter 7: Storage vs Memory (Data location)
// We can store in storage and memory
// Storage = on the blockchain for ever
// Memory = temporary

function feedAndMultiply (uint _zombieId, uint _targetDna) public {
    require (msg.sender == zombieToOwner[_zombieId]);
    Zombie storage myZombie = zombies[_zombieId];
}

//Chapter 8: Zombie DNA
