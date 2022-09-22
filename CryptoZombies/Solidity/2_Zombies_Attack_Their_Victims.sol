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
_targetDna = _targetDna % dnaModulus;
uint newDna = (myZombie.dna + _targetDna) / 2;
_createZombie("NoName", newDna);

//Chapter 9: More on Function Visibility
// public, private & external, internal
//private -> internal (accessible to contracts that inherit from this contract.)
//public -> external (can ONLY be called outside the contract.)
// edit function definition below
    function _createZombie(string memory _name, uint _dna) internal {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(id, _name, _dna);
    }

//Chapter 10: Interacting with other contracts

