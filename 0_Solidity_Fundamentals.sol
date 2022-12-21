// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0; 
//Import ""; //Serve pra importar outros contratos

contract MyContract {
    /**
     * VARIABLES
     * they must be typed specificly, because it is a staticly typed language.
     */
    string public name = 'Example1';
    bool public bool1 = true; 
    uint public myUint = 1;
    int public interger = 1;
    address public myAddress = 0x230FBb679118C95eAF9388af569e3974E29851C2;
    bytes32 public data; //Any data with 32 bytes, very used with gas.

//////////////////////////////////////////////////////////////////////////////////////////////////
    /**
     * FUNCTIONS
     * We have 2 types: Write (you pay gas) and Read functions (free)
     * We have visibility: public(all the code), internal (just inside the smart contract)
     */
    function setName(string memory _name) public {
        name = _name;
        // _name: this is a local variable that only can be accessible inside the function.
        // name: is a public variable, which means it can be accessible on all the contract
    }

    function getName() public view returns (string memory){
        return name;
    }

    function resetName() public {
        name = 'Example2';
    }
////////////////////////////////////////////

    /**
     * VISIBILITY
     */
    string name1 = 'name1'; //No visibility
    string private name2 = 'name2'; //Inside Smart Contract
    string internal name3 = 'name3'; //Inside, Inherited
    string public name4 = 'name4'; // Inside, Outside, Inherited

    // For functions it changes in thw following way:
    function nam1() public {} //Called Outside, Called by Another Function
    function nam2() private {} //Not Outside, Called by Another Function
    function nam3() external {} //Only Called Outside
    function nam4() internal {} //Only Called Inside 

////////////////////////////////////////////

    /**
     * MODIFIERS
     */
    function na1() public view {} //Can't modify State, Reads State: Of the Blockchain
    function na2() public pure {} //Can't modify State, Can't Reads State: Of the Blockchain
    function na3() public payable {} //Can Receive Crypto

    /**
     * CUSTOM MODIFIERS
     * You can create your own modifiers, for example:
     */

    address private owner;
    string public nname = '';

    //Here I create my modifier.
    modifier onlyOwner {
        require(msg.sender == owner, 'caller must be owner');
        _;
    }

    function settName(string memory _nname) onlyOwner public {
        nname = _nname;
    }

////////////////////////////////////////////
/**
 * CONSTRUCTOR
 * Is runed once and only once: Its the same as a function but you can only call it ONCE.
 */

    constructor (string memory _name) {
        name = _name;
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * GLOBAL VARIABLES: Used to provide info about the blockchain and access it. There are 3 types:
 * block, msg and tx:
 * 
 Block
// block.chainid (uint): current chain id
// block.coinbase (address payable): current block miner’s address
// block.difficulty (uint): current block difficulty
// block.gaslimit (uint): current block gaslimit
// block.number (uint): current block number
// block.timestamp (uint): current block timestamp as seconds since unix epoch

// gasleft() returns (uint256): remaining gas

Message
// msg.data (bytes calldata): complete calldata
// msg.sender (address): sender of the message (current call)
// msg.sig (bytes4): first four bytes of the calldata (i.e. function identifier)
// msg.value (uint): number of wei sent with the message

Transaction
// tx.gasprice (uint): gas price of the transaction
// tx.origin (address): sender of the transaction (full call chain)
 */
contract GlobalVariables {
    function globalVars() external view returns (address, uint, uint) {
        address sender = msg.sender; //Stores the address that called the function. Its data type is Address
        uint timestamp = block.timestamp; //Stores the Unix timestamp of when this function was called
        uint blocNum = block.number; //Stores the number of the block
    
        return (sender, timestamp, blocNum);
    }
}

//Another Example is

contract Global {
    address public contractAddress;
    address public payer;
    address public origin;
    uint public amount;

    constructor () {
        contractAddress = address(this); //The address of the actual contract 
    }

    function pay() public payable {
        payer = msg.sender; //The person calling the function
        origin = tx.origin; //The origin of the transaction
        amount = msg.value; //The ammount of cripto within the transaction
    }

    function getBlockInfo() public view returns (uint, uint, uint) {
        return(
           block.number, //The current number of the block on the chain
           block.timestamp, //The time
           block.chainid //And the chainID
        );
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * OPERATORS
 */

//ARITMETHICAL OPERATORS
contract Operators {
    function operators(uint a, uint b) external pure {
        a + b; //SUM
        a - b; //SUB
        a * b; //MUL
        a / b; //DIV
        a ** b; //EXP
        a % b; //MOD

        a++; //INCREMENT
        a--; //DECREMENT            
    }   

    function mathExample() external pure returns (uint) {
        uint a;
        a = a + 1; // 1
        a ++; // 2
        a = a * 2; // 4
        a = a ** 2; // 16
        a = a / 2; // 8
        a = a - 2; // 7
        a--; // 6
        return a;
    }
}

//COMPARISION OPERATORS
contract comparision {
    function compar(uint a, uint b) external pure {
        a == b; //Equal
        a != b; //Not Equal
        a > b; //Greater than
        a < b; //Less than
        a >= b; //Greater than or Equal to
        a <= b; //Less than or Equal to

        a++; //INCREMENT
        a--; //DECREMENT            
    }

    //Example of non-integer comparison
    function checkAddress() external pure returns (bool) {  
        address address1; // = 0x1234;
        address address2;// = 0x1234;
        return (address1 == address2);
    }    
}

//LOGICAL OPERATORS
contract logical {
    function operators(uint a, uint b) external pure {
        // a && b; - And: Both true
        // a || b; - Or: One is true
        // !a; - Not: None is true
    }

    //Example
    function logicalOperators() external pure returns (bool) {  
        return (1 + 1 == 2) && (2 + 2 == 4);
    }   
}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * CONDITIONALS
 */

contract conditionals {
    function ifElseOthers() private pure returns (string memory) {

        uint x = 2;

        //Traditional Form
        if (x % 2 == 0) {
            return 'Even';
        }
        else {
            return 'Odd';
        }
    }

    function ifSimple() private pure returns (string memory) {
        //Simple...
        uint x = 2;
        if (x % 2 == 0) {
            return 'Evedn';
        }

        return 'Odds';
    }

    function ifMasSimple() private pure returns (string memory) {
        //Even Simplier
        uint x = 2;
        return x % 2 == 0 ? 'Even' : 'Odd';
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * ARRAYS
 * Sorted lists of information
 */

contract arrays {
    uint [] public array1 = [1, 2, 3]; //Declaring explicitly
    uint [] public array2; //Initialize an Array (Empty)
    uint [10] public array3; //Array with set of spaces, meaning, a specific size. 10 zeros in this case

    //Same Thing
    string [] public array4 = ['Hi', 'Hello', 'Hallo']; 
    string [] public array5; 
    string [10] public array6; 
}

    //MANIPULATING ARRAYS
contract manipulating {

    uint [] public array;

    function getAndLength(uint i) public view returns (uint){
        return array[i];       //Reading
        return array.length;   //Length
    }

    function pushAndPop(uint i)  public {
        return array.push(i);  //Add a value to the end
        return array.pop();    //Delete the last value
    }

    function remove(uint index) public {
        delete array[index]; //Delete an specific element at the index
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * MAPPINGS
 * Key value pairs. With an ID, and a value, just like objects work.
 * 1. We have the mapping keyword.
 * 2. You give it a key: uint
 * 3. You give a value: string
 * mapping ( type => type ) name;
 * 
 */

contract map {
    mapping (uint => string) public names; //Mapping of names
    mapping (uint => address) public addresses; //Mapping of addresses: very common
    mapping (address => uint) public bakances; //Mapping of bakances
    mapping (address => bool) public hasVoted; //Mapping of hasVoted

    //Nested mappings
    mapping (address => mapping (uint => bool)) public theMapping; //An address that corresponds to
                                                                  // another mapping

    //You can also manipulate mappings inside and outside a smart contract
    mapping (uint => string) public myMapping;
    function get(uint _id) public view returns (string memory){
        return myMapping[_id]; //Read the value, by passing the key (_id)
    }

    function setAndDelete(uint _id, string memory _value) public {
        myMapping[_id] = _value; //Setting the value by passing the key and passing a value
        delete myMapping[_id]; //Deleting an item; Resets the value to the default value.

    }
} 

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * STRUCTS
 * Create your own types, and assing values to them.
 */

contract structs {
    struct Book { //Creating the struct
        string title; //Assign values to the types
        string author;
        bool completed;
    }

    //MANIPULATING STRUCTS
    //Array of books, using the type I created with the struct. Old way: uint[] public name;
    Book[] public books;

    //Pusshing to the array: adding a book
    function add(string memory _title, string memory _author) public {
    //  array.push(struct(value1, value2, value3));
        books.push(Book(_title, _author, false));
    }

    //Get the book from the array
    function get(uint _index) 
    public 
    view 
    returns (string memory title, string memory author, bool completed) {
        Book storage book = books[_index];
        return (book.title, book.author, book.completed);
    }

    //Mark the book completed
    function complete(uint _index) public {
        Book storage book = books [_index];
        book.completed = true;
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * EVENTS
 */

contract events {
    string public message = 'Hello, World!';

    event MessageUpdated (
        address indexed _user,
        string _message
    );

    function updateMessage(string memory _message) public {
        message = _message;
        emit MessageUpdated(msg.sender, _message);
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * ETHER
 */

contract Ether {
    uint public value1 = 1 wei;
    uint public value2 = 1;
    uint public value3 = 1 gwei;
    uint public value4 = 1000000000;
    uint public value5 = 1 ether;
    uint public value6 = 1000000000000000000;

    //
    receive() external payable {}

    //
    uint public count = 0;
    fallback() external payable {
        count ++;
    }

    //
    function checkBalance() public view returns (uint) {
        return address(this).balance;
    }

    //
    function transfer(address payable _to) public payable {
        msg.sender;
        (bool sent, ) = _to.call{value: msg.value} ('');
        require(sent, 'Failed!');
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * ERRORS
 */

contract errors {
    event Log(string message);

    function example1(uint _value) public {
        require(_value > 10, 'Must be greater than 10');
        emit Log('Success');
    }

    function example2(uint _value) public {
        if (_value <= 10) {
            revert ('Must be greater than 10');
        }
        emit Log ('Success');
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * INHERITANCE
 */

contract Ownable {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, 'Caller must be owner');
        _;
    }
}

contract MyyContract is Ownable {
    string public name = 'Example1';

    function setName(string memory _name) public onlyOwner {
        name = _name;
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * CALLING OTHER CONTRACTS
 */

contract SecretVault {
    string private secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function setSecret(string memory _secret) external {
        secret = _secret;
    }

    function getSecret() external view returns (string memory) {
        return secret;
    }
}

contract myContract {
    SecretVault public secretVault;

    constructor(SecretVault _secretVault) {
        secretVault = _secretVault;
    }

    function setSecret(string memory _secret) public {
        secretVault.setSecret(_secret);
    }

    function getSecret() public view returns (string memory) {
        return secretVault.getSecret();
    }
}
//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * INTERFACES 
 */

interface IERC20 {
   function transferForm(
        address _from, 
        address _to, 
        uint256 _value
    ) 
        external returns (bool success); 
}

contract inter {
    function deposit(address _tokenAddress, uint _amount) public {
        IERC20(_tokenAddress).transferForm(msg.sender, address(this), _amount);
    }
}