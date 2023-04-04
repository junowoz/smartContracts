/**
 * Public Key Cryptography*
 * In this series of exercises we will be focused on Public Key Cryptography with ECDSA (Elliptic Curve Digital Signature Algorithm).
 * The specific algorithm we will use is secp256k1, which is the curve used for both Bitcoin and Ethereum.
 *
 * You will learn how to sign a hashed message, recover the public key from the signature and transform the public key into the user's ethereum address.
 *
 * This will be crucial knowledge when building applications interacting with blockchain as well as smart contracts on the blockchain.
 * **/

// Your Goal: Hash the Message
const { keccak256 } = require("ethereum-cryptography/keccak");
const { utf8ToBytes } = require("ethereum-cryptography/utils");

function hashMessage(message) {
    const bytes = utf8ToBytes(message);
    const hash = keccak256(bytes);

    return hash;
}

module.exports = hashMessage;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/** META: ASSINAR A MENSAGEM**/
//Importação da biblioteca ethereum-cryptography/secp256k1 para assinar a mensagem
// e da função hashMessage que foi criada anteriormente para criar a hash da mensagem
const secp = require("ethereum-cryptography/secp256k1");
const hashMessage = require("./hashMessage");

//Chave privada usada para assinar a mensagem. É importante notar que essa chave é apenas um exemplo e não deve ser usada em produção
const PRIVATE_KEY =
    "6b911fd37cdf5c81d4c0adb1ab7fa822ed253ab0ad9aa18d77257c88b29b718e";

//Função signMessage que recebe uma mensagem como parâmetro
async function signMessage(msg) {
    //Criação da hash da mensagem usando a função hashMessage
    const hash = hashMessage(msg);
    //Definição da opção "recoverable" para que a chave pública possa ser recuperada a partir da assinatura
    const options = { recoverable: true };
    //Assinatura da mensagem com a chave privada PRIVATE_KEY e a opção "recoverable"
    const signature = secp.sign(hash, PRIVATE_KEY, options);
    //Retorno da assinatura
    return signature;
}

//Exportação da função signMessage para ser utilizada em outros arquivos
module.exports = signMessage;
