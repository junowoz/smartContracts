/**
 * The exercise is asking to create a function that, given a SHA256 hash, finds the color input that would generate that hash.
 * The COLORS array is given which contains the possible colors that the hash could represent, the function should iterate through the array and compare the hash of each color with the given hash, if a match is found it should return the corresponding color.
 */

const { sha256 } = require("ethereum-cryptography/sha256");
const { toHex, utf8ToBytes } = require("ethereum-cryptography/utils");

const COLORS = ['red', 'green', 'blue', 'yellow', 'pink', 'orange'];

function findColor(hash) {
    // This function takes in the given hash as an argument
    // It iterates through each color in the COLORS array
    for (let color of COLORS) {
        // For each color, it converts the color string to bytes using the utf8ToBytes function
        const colorBytes = utf8ToBytes(color);
        // Then it takes the SHA256 hash of the bytes using the sha256 function
        const colorHash = sha256(colorBytes);
        // It then compares the resulting hash to the given hash using the toHex function
        if (toHex(colorHash) === toHex(hash)) {
            // If a match is found, it returns the corresponding color
            return color;
        }
    }
    // If no match is found, it returns null
    return null;
}

module.exports = findColor;
