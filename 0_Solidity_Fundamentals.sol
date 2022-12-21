/// @title SOLIDITY FUNDAMENTALS
/// @author @junowoz
/// @notice pretty much all you need to know to catch up with solidity.

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0; 

//import ""; //This way you import contracts

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

////////////////////////////////////////////

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

////////////////////////////////////////////

    //MANIPULATING STRUCTS
    //Array of books, using the type I created with the struct. Old way: uint[] public name;
    Book[] public books;

    //Pusshing to the array: adding a book
    function add(string memory _title, string memory _author) public {
    //  array.push(struct(value1, value2, value3));
        books.push(Book(_title, _author, false));
    //with Book I create a new book
    }

    //Get the book from the array
    function get(uint _index) 
    public 
    view 
    returns (string memory title, string memory author, bool completed) {
        Book storage book = books[_index];
        return (book.title, book.author, book.completed); //Return the attributes 
    }

    //Mark the book completed
    function complete(uint _index) public {
        Book storage book = books [_index]; //Read it from storage, refetch the book
        book.completed = true; //Marked as completed assigning the value to true
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * EVENTS
 * Solidity lets you subscribe to events from an external consumer, to find out if anything inside
 * a function has ben called.
 * I can get a notification anytime my function is called, in real time, by subscribing to the event.
 * I can Index up to 3 values, and set 17 of them.
 */

contract events {
    string public message = 'Hello, World!';

    //We create an event, and we pass arguments such as the user and the message
    event MessageUpdated (
        address indexed _user, //Index let me filter to the specific variable
        string _message
    );

    //Here I create the funcion 
    function updateMessage(string memory _message) public {
        message = _message; //I pass the message to the variable I created before
        emit MessageUpdated(msg.sender, _message); //And emit the event
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * ETHER
 * An Ether is divisable by 18 decimal places.
 * The small unit is WEI(18 zeros), and another value is GWEI (9 zeros. Used mostly for gas).
 * 
 * WEI   1000000000000000000
 * GWEI  1000000000
 * ETHER 1
 */

contract Ether {
    // 1 WEI is 1 WEI
    uint public value1 = 1 wei;
    uint public value2 = 1;

    //1 GWEI is 1+9 zeros WEI
    uint public value3 = 1 gwei;
    uint public value4 = 1000000000;

    // 1 ETHER equals 1+18 zeros WEI
    uint public value5 = 1 ether;
    uint public value6 = 1000000000000000000; 

////////////////////////////////////////////

    //You can receive ether directly to a smart contract with the receive function + external + payable
    receive() external payable {}

    //You can also use the fallback function if no receive function is implemented, and if msg.data is not implemented
    uint public count = 0;
    fallback() external payable {
        count ++;
    }

////////////////////////////////////////////

    //You can check the balance of any address inside a smart contract
    function checkBalance() public view returns (uint) {
        return address(this).balance;
    }

    //You can send ether to a different address with call 
    //Any function can receive ether as long as you use the payable modifier.
    //You can access the value inside te function using msg.value
    //Check the sender with msg.sender
    function transfer(address payable _to) public payable {
        msg.sender;
        (bool sent, ) = _to.call{value: msg.value} ('');
        require(sent, 'Failed!');
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * ERRORS
 * requite - condition
 * revert - prints something
 * emit Log() - prints
 */

contract errors {
    event Log(string message);

    function example1(uint _value) public {
        //Require checks if something is true or false, and then does something.
        //If its true, it continues to execute.
        require(_value > 10, 'Must be greater than 10');
        emit Log('Success'); //This prints a message
    }

    function example2(uint _value) public {
        if (_value <= 10) { //if this is true
            revert ('Must be greater than 10'); //print this
        } //if not
        emit Log ('Success'); // print this
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * INHERITANCE
 * Smart Contracts that inherit behaviour from other SCsm using the 'is' keyword
 * Example:
 * contract name is name2 {
 * }
 */

//Contract where we set some instructions
contract Ownable {
    address owner;

    //We set here that the onwser is the msg.sender
    constructor() {
        owner = msg.sender;
    }

    //And we create a type called onlyOwner so we can use this in other contracts after
    modifier onlyOwner {
        require(msg.sender == owner, 'Caller must be owner');
        _;
    }
}

//This contract inherits from Ownable using the keyword 'is';
contract MyyContract is Ownable {
    string public name = 'Example1';

    //So here, we inherit the modifier called onlyOwner and also the constructor.
    function setName(string memory _name) public onlyOwner {
        name = _name;
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * CALLING OTHER CONTRACTS
 * How to speak to other contracts within one contract?
 */

//We create a contract which stores a secret on chain
contract SecretVault {
    string private secret;

    //Storing the secret
    constructor(string memory _secret) {
        secret = _secret;
    }

    //Here we set the secret
    function setSecret(string memory _secret) external {
        secret = _secret;
    }

    //Here we get the secret
    function getSecret() external view returns (string memory) {
        return secret;
    }
}

//Now, in this contract, we'll interact with the first one:
contract myContract {
    //Inside the following constructor we take the address for the other contract and we save it here:
    //The type is the name of the contract
    SecretVault public secretVault;

    constructor(SecretVault _secretVault) {
        secretVault = _secretVault;
    }

    //Here we set the secret, by calling the other contract inside a variable . the name of the function
    function setSecret(string memory _secret) public {
        secretVault.setSecret(_secret);
    }

    //To get the secret, is the same as above
    function getSecret() public view returns (string memory) {
        return secretVault.getSecret();
    }
}
//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * INTERFACES 
 * Common way to talk to smart contracts
 */

//This is a common type of token on the blockchain. All we have to know is the specific functions we
// want to call. In this case the transferForm with its values
interface IERC20 {
   function transferForm(
        address _from, 
        address _to, 
        uint256 _value
    ) 
        external returns (bool success); 
}

contract interfacee {
    function deposit(address _tokenAddress, uint _amount) public {
        IERC20(_tokenAddress).transferForm(msg.sender, address(this), _amount);
        //Here we set the function, and we call the IERC20 with the token address.
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * 
 * BUILDING...
 * 
 */

// ...


// ...


// ...