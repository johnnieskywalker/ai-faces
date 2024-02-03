// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "erc721a/contracts/ERC721A.sol";

contract AiFaces is ERC721A {
    constructor() ERC721A("MyNFTCollection", "MNFT") {}

    function mint(uint256 quantity) public {
        _mint(msg.sender, quantity);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return "ipfs://YourBaseURIHere/";
    }
}
