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