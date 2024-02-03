// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {ERC721A} from "../lib/ERC721A/contracts/ERC721A.sol";

contract AiFaces is ERC721A {
    string public constant BASE_URI = "https://github.com/johnnieskywalker/ai-faces/tree/main/pictures/";

    constructor() ERC721A("AiFaces", "AIFA") {}

    function mint(uint256 quantity) public {
        _mint(msg.sender, quantity);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return BASE_URI;
    }
}
