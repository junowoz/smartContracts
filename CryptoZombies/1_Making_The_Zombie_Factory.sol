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

}

///////////////////////////////////////////////////////////////////////////////////////
//Chapter 7: Function Declarations
function eatHamburgers(string memory _name, uint _amount) public {

}
