# AiFaces NFT Collection
The AiFaces NFT collection is a blockchain-based digital art collection by banantosh_, featuring unique AI-generated faces but then painted by real artist. 
This project is built using Solidity and leverages the ERC721A contract for efficient batch minting. The project is set up and managed using Foundry, a fast, flexible, and comprehensive toolkit for Ethereum application development.

# Project Structure
src/AiFaces.sol: Main contract file for the AiFaces NFT collection, extending the ERC721A contract for optimized NFT minting.
test/AiFacesTest.sol: Test suite for the AiFaces contract, ensuring correct behavior of the minting functionality.


Below is a template for a README file for your project, which includes an introduction, instructions for running tests and generating coverage reports using Foundry's forge tool. Feel free to customize this template to better fit your project's needs.

# Running Tests
To run the test suite for the AiFaces contract, use the following command:

```bash
forge test
```
This command compiles the project and runs the specified tests, outputting the results in the terminal.

## Generating Test Coverage
To generate a test coverage report for the AiFaces contract, run:

```bash
forge coverage
```

# Running Anvil and Deploying the AiFaces Contract
This guide will walk you through running Anvil (a local Ethereum node), deploying the AiFaces contract to it, and interacting with the contract via the console.

## Step 1: Start Anvil
First, ensure you have Anvil installed as part of the Foundry toolset. In a terminal, start Anvil to run a local Ethereum node:

```bash
anvil
```
Anvil will provide a list of unlocked accounts with their addresses and private keys for use.

## Step 2: Deploy the AiFaces Contract
To deploy the AiFaces contract, use the forge create command with the contract's Solidity file and specify the RPC URL of the running Anvil node (http://localhost:8545). Use one of the unlocked accounts provided by Anvil for the deployment. For example:
```bash
forge create src/AiFaces.sol:AiFaces --rpc-url http://localhost:8545 --unlocked --from 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
```
_(use your anvil address instead of 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266)_

This command will compile your contract (if not already compiled) and deploy it to the Anvil node. Take note of the "Deployed to" address; this is your contract's address on the local EVM node.

## Step 3: Interact with the Deployed Contract
After deployment, you can interact with the AiFaces contract. Here are some examples using cast, another tool from the Foundry suite:

### Reading Data
To read data, such as the base URI set in your contract:
```bash
cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "baseURI()" --rpc-url http://localhost:8545
```

The response can seem cryptic at first, but it follows a structured format according to the Ethereum ABI (Application Binary Interface) encoding.

for example:
```sh
 cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "baseURI()" --rpc-url http://localhost:8545

0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004a68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f6a6f686e6e6965736b7977616c6b65722f61692d66616365732f6d61696e2f6d657461646174612f00000000000000000000000000000000000000000000
```

The first 0x20 (or 32 in decimal) indicates the offset where the actual data starts. This is a common pattern for dynamic data types like strings in ABI encoding.
Following the offset, the next 0x4a (or 74 in decimal) specifies the length of the data that follows. In this case, the string length.
The rest is the actual string data, representing the baseURI. It's in hexadecimal format and needs to be converted to a human-readable string. The example you provided decodes to: https://raw.githubusercontent.com/johnnieskywalker/ai-faces/main/metadata/.
See in for example https://codebeautify.org/hex-string-converter

# Writing Data to the Contract
To write data to the contract or execute a function that modifies the state, you use cast send. This requires specifying which function to call and providing necessary parameters along with it.

For example, to change the baseURI, setBaseURI(string memory _newBaseURI), you could use:
```sh
cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "setBaseURI(string)" "https://misie.wiki/" --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --rpc-url http://localhost:8545
```

where 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 is private key of 0x5FbDB2315678afecb367f032d93F642f64180aa3

example outcome is:

```sh
 cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "setBaseURI(string)" "https://misie.wiki/" --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --rpc-url http://localhost:8545


blockHash               0x60bc3b45200acaf43709edeb6e269dc0a1bc8a4b5c05e472257027bff832087a
blockNumber             3
contractAddress         
cumulativeGasUsed       29922
effectiveGasPrice       3774887435
from                    0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
gasUsed                 29922
logs                    []
logsBloom               0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
root                    
status                  1
transactionHash         0x8c28f1beb1096ddca4e61193dbdcf37623492a49d8d133a5c22833c637d4969c
transactionIndex        0
type                    2
to                      0x5fbd…0aa3
```

# Deploy to testnet

You can deploy the contract using forge create command. You'll need to specify the RPC URL (if not set as an environment variable), the private key of your wallet (consider using environment variables or a secure method to pass this information), and the path to your contract.

Important: Do not directly input your private key into the terminal or store it in an insecure location. Consider using environment variables or a secure vault.

```sh
forge create src/AiFaces.sol:AiFaces --rpc-url $RPC_URL --private-key $PRIVATE_KEY
```

Existing testnet deployments:

https://goerli.etherscan.io/address/0x20918C3ddF482e886DE87Fd5757903dc2A3F6cC2

To verify

```sh
export ETHERSCAN_API_KEY=YOUR_API_KEY &&
forge verify-contract --chain-id goerli 0x20918C3ddF482e886DE87Fd5757903dc2A3F6cC2 src/AiFaces.sol:AiFaces --watch
```
(or other address)
# Mainnet deployment

Contract was deployed to BASE mainnet:

```sh
Deployer: 0xedE94599d2cfA54812b8afb356D29eCB07C7758d
Deployed to: 0xc0b5A02845b179B709805DEfeFd9361A5704BaCd
Transaction hash: 0x50d7553a1c33905972c64514833660b3e79d535e1147b10cf757b706aca8b992
```

# Mint on mainet from your terminal (secure your private key or use one for just one time use)

```sh
export ETH_PRIVATE_KEY=YOUR_PRIVATE_KEY

DATA=$(cast abi-encode "mint(uint256)" QUANTITY)
```