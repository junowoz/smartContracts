# Public Key Cryptography

As cryptography advanced over the years, more complex functions were introduced to hide messages better. One important leap forward was the idea of a secret key.
If two parties can meet prior to their exchange of messages they both can come to an agreement upon a particular key. This key plus a function (like the alphabet shift mentioned above) could be used together to create a more secure encryption.

Having keys on both sides of the message is considered symmetric-key cryptography.

Now imagine Bob has declared a public key far and wide as the key that identifies him. Bob will keep a private key that corresponds to his public key. When he uses his private key to encrypt a message, he can share it publicly to be decrypted using his public key. 

Upon decrypting this message, we can say beyond the shadow of a doubt that only Bob could have written this message. The only key that could have encrypted the message is the corresponding private key which only Bob has access to. In practice, this would create an unforgettable digital signature for Bob.

As opposed to the encryption techniques mentioned in the above section, public key cryptography is considered asymmetric encryption in that only one party has access to the private key.

### RSA and ECDSA
Today, both RSA and ECDSA are two popularly used algorithms for public key cryptography.

The RSA algorithm is based on the idea that it's very easy to find the product of two prime numbers, yet extremely difficult to factor out those two prime numbers if you have the product. You can see this example on Wikipedia for a good rundown.

The ECDSA algorithm uses elliptic curves. It can provide the same level security as other public key algorithms with smaller key sizes, which is the reason it's become quite popular. It is the Digital Signing Algorithm used by Bitcoin, specifically the secp256k1 curve.