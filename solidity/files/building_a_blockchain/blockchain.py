#Representing Transactions: This transaction is best represented in the form of a
# Python dictionary, with keys for the required fields and values specific to the transaction.
#These transactions are all stored inside the mempool, a pool of transactions that miners reference
# when selecting the set of transactions they want to verify.

transaction1 = {
  'amount': '30',
  'sender': 'Alice',
  'receiver': 'Bob'}
transaction2 = {
  'amount': '200',
  'sender': 'Bob',
  'receiver': 'Alice'}
transaction3 = {
  'amount': '300',
  'sender': 'Alice',
  'receiver': 'Timothy' }
transaction4 = {
  'amount': '300',
  'sender': 'Rodrigo',
  'receiver': 'Thomas' }
transaction5 = {
  'amount': '200',
  'sender': 'Timothy',
  'receiver': 'Thomas' }
transaction6 = {
  'amount': '400',
  'sender': 'Tiffany',
  'receiver': 'Xavier' }
my_transaction = {
  "amount" : "23","sender" : "Juan","receiver" : "Alfred"
}
mempool = [transaction1, transaction2, transaction3, transaction4, transaction5, transaction6, my_transaction]

# add your code below
block_transactions = [transaction1, transaction2, transaction3]

########################################### import datetime library
from datetime import datetime
# print current date and time
print (datetime.now())

# datetime object containing current date and time

class Block:
# default constructor for block class
  def __init__(self, transactions, previous_hash, nonce = 0, timestamp = datetime.now()):
    self.transactions = transactions
    self.previous_hash = previous_hash
    self.nonce = nonce
    self.timestamp = timestamp
    pass


########################################### import sha256
from hashlib import sha256

# text to hash
text = "I am excited to learn about blockchain!"
hash_result = sha256(text.encode())

# print result
print(hash_result.hexdigest())

# esto va a crear esto: 6866cb54011a5562052b7dbce8d7afa26195cbb7a73c3e70a56dc1a25d6df831

# si cambio un pequeño caracter, resulta en: 32ad45b332a7e5869d6d5aac178a1af413b04b206047709ea021df8d4d21ff56

#Creating block hashes
from datetime import datetime
from hashlib import sha256


class Block:
  def __init__(self, transactions, previous_hash, nonce=0):
    self.timestamp = datetime.now()
    self.transactions = transactions
    self.previous_hash = previous_hash
    self.nonce = nonce
    self.hash = self.generate_hash()

  def print_block(self):
    # prints block contents
    print("timestamp:", self.timestamp)
    print("transactions:", self.transactions)
    print("current hash:", self.generate_hash())

  def generate_hash(self):
    # hash the blocks contents
    block_contents = str(self.timestamp) + str(self.transactions) + str(self.previous_hash) + str(self.nonce)
    block_hash = sha256(block_contents.encode())
    return block_hash.hexdigest()

###

# imports the Block class from block.py
from block import Block


class Blockchain:
  def __init__(self):
    self.chain = []
    self.all_transactions = []
    self.genesis_block()

  def genesis_block(self):
    transactions = []
    previous_hash = "0"
    self.chain.append(Block(transactions, previous_hash))

#### adding new blocks
# imports the Block class from block.py
from block import Block


class Blockchain:
  def __init__(self):
    self.chain = []
    self.all_transactions = []
    self.genesis_block()

  def genesis_block(self):
    transactions = {}
    genesis_block = Block(transactions, "0")
    self.chain.append(genesis_block)
    return self.chain

  # prints contents of blockchain
  def print_blocks(self):
    for i in range(len(self.chain)):
      current_block = self.chain[i]
      print("Block {} {}".format(i, current_block))
      current_block.print_contents()

      # add block to blockchain `chain`

  def add_block(self, transactions):
    previous_block_hash = self.chain[len(self.chain) - 1].hash
    new_block = Block(transactions, previous_block_hash)
    self.chain.append(new_block)

