// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract MyContract {
    string value;

    constructor ()  public {
        value = "myValue";
    }

    function set(string memory _value) public {
        value = _value;
    }

    function get() public view returns(string memory){
        return value;
    }

}

contract types {
    string public stringValue = "myValue";
    bool public myBool = true;
    int public myInt = 1; //can be negative
    uint public myUint = 1; //cant be negative and can be signed

    uint8 public myUint8 = 8;
    uint256 public myUint256 = 256;
}

contract enums {
    enum State {Waiting, Ready, Active}
    State public state;

    constructor() public {
        state = State.Waiting;
    }

    function activate() public {
        state = State.Active;
    }

    function isActive() public view returns (bool){
        return state == State.Active;
    }

}

contract structs {

    Person[] public people

    struct Person {
        string _firstName;
        string _lastName;
    }
}