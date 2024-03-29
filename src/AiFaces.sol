// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {ERC721A} from "../lib/ERC721A/contracts/ERC721A.sol";

contract AiFaces is ERC721A {
    uint256 public constant MAX_SUPPLY = 107;
    string public baseURI = "https://raw.githubusercontent.com/johnnieskywalker/ai-faces/main/metadata/";
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "sender is not the owner");
        _;
    }

    constructor() ERC721A("AiFaces", "AIFA") {
        owner = msg.sender;
    }

    function mint(uint256 quantity) public {
        require(totalSupply() + quantity <= MAX_SUPPLY, "Exceeds maximum supply");
        _mint(msg.sender, quantity);
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        if (!_exists(tokenId)) revert URIQueryForNonexistentToken();

        string memory baseURI = _baseURI();
        return bytes(baseURI).length != 0
            ? string.concat(string(abi.encodePacked(baseURI, _toString(tokenId))), ".json")
            : "";
    }
}
