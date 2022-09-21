// SPDX-License-Identifier: SEE LICENSE IN LICENSE
//Capitulo 2: Contratos

pragma solidity ^0.4.19;

contract ZombieFactory {
    constructor() {
        
    }
}
///////////////////////////////////////////////////////////////////////////////////////
//Variáveis de Esado e Inteiros

contract Example {
  // Isto vai ser gravado permanentemente na blockchain
  uint myUnsignedInteger = 100; //não pode ser negativo
}

///////////////////////////////////////////////////////////////////////////////////////
//Operações Matemáticas: Iguais que em qualquer outro tipo de linguagem
contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 * * dnaDigits; //Operação
    // comece aqui

}

///////////////////////////////////////////////////////////////////////////////////////
//Estruturas (structs): Tipo de dado mais complexo que permite múltiplas propriedades.
struct Person {
  uint age;
  string name; //Novo tipo de dado, String
}

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    // comece aqui
    struct Zombie{
        string name;
        uint dna;
    }

}

///////////////////////////////////////////////////////////////////////////////////////
//Listas (arrays): podemos ter arrays com números fixos, e dinâmicos: com qualquer quantidade
 
uint[2] fixedArray;
string[5] stringArray;

uint[] dinamicArray;

//Também é possível criar arrays de estruturas
Person[] people; //Criar um array dinâmico serve para guardar dados estruturados no contrato [base de dados]

//Arrays públicos: Outros contracts poderão ler o array (não escrever.)
Person[] public people;

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    // comece aqui
    Zombie[] public zombies;

    //Chapter 7: Function Declarations
    //function createZombie(string memory _name, uint _dna) public {
    //Chapter 8: Working With Structs and Arrays
    //zombies.push(Zombie(_name, _dna)); 
    //}

    //Chapter 9: Private / Public Functions
    function _createZombie(string memory _name, uint _dna) private {
    zombies.push(Zombie(_name, _dna));
    }

    //Chapter 10: More on Functions
    // return = returns
    // public / private = everyone | no one can see it
    // view = it only views the data but doesn't modify
    // pure = you're not even accessing any data

    function _generateRandomDna(string memory _str) private view returns (uint) {
        //Chapter 11: Keccak256 and Typecasting
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    //Chapter 12: Putting It Together
    function createRandomZombie (string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

    //Chapter 13: Events
    //The way to communicate with the front-end and tell something happened in the blockchain

    event NewZombie(uint zombieId, string name, uint dna);

}

////////////////////////////////////////////////////////
// Code Completed

pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {

    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        emit NewZombie(id, _name, _dna);

    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
