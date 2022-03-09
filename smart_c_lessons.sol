pragma solidity ^0.8.0; //aqui vamos identificar a versão do Sol usada.

contract guardaloteria {
        uint numerosorteado;

    constructor(uint numeroinicial) public{
        numerosorteado = numeroinicial;
    }
    function set(uint enviado) public{ //as variaveis dentro da função não são armazenadas la blockchain
        numerosorteado = enviado;
    }
    function get() public view returns (uint){
        return numerosorteado;
    }
}

/*
Funções e Variáveis.

- function- são os métodos pelos quais se pode interagir ou criar
funcionalidades para os contratos

-Set- tem um nome identificador da função (este é o nome da minha função)

-Public- é que podem ser acessiveis por qualquer um
ou privadas (unicamente para o dono)

-numerosorteado- é uma variavel, um nome simbólico que guarda espaço.
elas não são voláteis, ou ficam aí sempre, mesmo que o programa não seja tocado
qualquer parte do contrato tem acesso às variáveis.

-set(uint enviado)- é um tipo de variável local que apenas existe no escopo daquela função
ou seja que ela é volatil.

-uint- devemos especificar o tipo de valor que vamos guardar

ENVIANDO UM VALOR: quando invocamos uma função, usamos parámetros para enviar valores

RETORNANDO UM VALOR: na declaração da função declaramos que ela retorna um valor usando o
comando "returns". Devemos colocar dentro da função o que queremos retornar

-----------------------------------------------------------------------------------------
GAS: cada função gasta um valor de gas, a menos que só queramos ler um valor. Neste caso
a função SET teve um custo de gas para poder correr este contrato.

CONTAS: Existem dois tipos de contas em ethereum, as contas pessoa e conta código.
Uma conta pessoa é controlada por pares de chaves pública-privada. Em geral são contas de
pessoas, mas podem ser controladas por qualquer um que tenha o par de chaves. O endereço
da conta é determinad a partir da chave pública, e é incapaz de armazenas e transferir fundos.

Conta código/Conta de contratos: São controladas pelo código junto à conta. Seu funcionamento
é definido por códigos de programação: Contratos inteligentes.
é capaz de: armazenas, transferir fundos;armazenas/processar informações, guardar estado,etc...

todas as contas são tratadas iguais pela EVM
Toda conta tem um storage de chave valor
Toda conta tem um saldo em Ether (na verdade Wei). Ou seja
1.000.000.000.000.000.000 Wei == 1 Ether (10^18 wei)

lembre-se de colocar sempre Environment = Javascript VM
Na parte de Account, repare que você tem contas demo, e assim que você faz um contrato, o valor
de wei da conta começa a diminuir.
Cada conta tem seu address e cada contrato também, o que acaba aparecendo na blockchain.

-------------------------------------------------------------------------------------------
Construtor, Operadores, Funções Especiais e Condicionais.

Construtores: é uma função especial , e ele é executado sómente uma vez. Ele também é
completamente opcional. A diferença é que ele não tem nome praticamente.
No código dizemos que ele recebe um numero inicial, e que o numerosorteado recebe aquela variavel
que entra no construtor baixo a variavel temporal de numero inicial.

msg.sender (address): é o numero da conta de quem chamou o contrato
msg.value(uint): é o numero de wei enviado com a mensagem
selfdestruct(address recipient): destroi o contrato atual e envia os fundos para o endereço definido.
                                uma nova execução não será permitida.

Operadores: < menor, > maior
            <=, >=, ==, !=
            && (and)
            [[ (or)
            +, -, ++(incremento), --(decremento)
            *, /, % (módulo), **(exponente)

Condicionais: if... else...
*/

//Vamos testar Condicionais

contract guardaloteria {
    uint numerosorteado;
    address dono;
    uint contadordesorteios = 0;
    bool donorico = false;

    constructor(uint numeroinicial) public{
        require (msg.sender.blanace > 99.9999999 ether);
        //Require serve para executar se o requerimento for verdadeiro
        numerosorteado = numeroinicial;
        dono = msg.sender;
        contadordesorteios = 1;

        if (msg.sender.balance > 20 ether) {
            donorico = true;
        }
        else {
            donorico = false;
        }
    }

    function set(uint enviado) public {
        numerosorteado = enviado;
        contadordesorteios++;
    }
    function get() public view returns (uint) {
        return numerosorteado;
    }
    function getcontador()public view returns (uint) {
        return contadordesorteios;
    }
    function getdono()public view returns (address) {
        return dono;
    }
    function getrico()public view returns (bool) {
        return donorico;

}
/*
Funções avançadas:
function (<parameter types,>) {(visibilidade) internal /external}
[pure / constant / view/payable] [returns (<return types>)]

- parametros
- Visibilidade
        -public, external, internal, private
-modificadores
        - pure/ view (nao muda o estado), payable (pode receber ether), constant(não permite guardar info)
- retorno

Uma função pagável recebe Ether / ---/ ETH da ocnta que chama aquela função
O ether é adicionado ao saldo do contrato, e isto fica guardado em this.balance - ou - <endereço>.balance
Agora, o contrato deve prever qualquer situação. Por exemplo:
    e se o cliente não mandar ETH suficiente?
    e se mandar ETH demais? se manda troco

MODIFIERS: serve para mudar o comportamento de funções.
EVENTOS: usam a capacidades de log(registro) da evm.
        podem ser usados para criar Daaps interativas que respondem ao que acontece no contrado.
        Eventos são armazenados em uma estrutura especial na blockchain, asociados ao endereço.

*/

function set(uint enviado) public payable comcustominimo(1000){ //que seja payable é que pode receber ether
    modifier comcustominimo(uint min) {
        require(msg.value >= min, "não foi enviado ether suficiente") // a virgula significa (else)
        _; //isso significa: continue rodando a função
    }

}
