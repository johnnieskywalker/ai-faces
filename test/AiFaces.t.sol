// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "../lib/forge-std/src/Test.sol";
import "../src/AiFaces.sol";

contract AiFacesTest is Test {
    AiFaces public myNFT;

    function setUp() public {
        myNFT = new AiFaces();
    }

    function testMint() public {
        myNFT.mint(1);
        assertEq(myNFT.balanceOf(address(this)), 1);
    }

    function testTokenURI() public {
        myNFT.mint(1);
        string memory expectedTokenURI = "https://github.com/johnnieskywalker/ai-faces/tree/main/pictures/0";
        string memory actualTokenURI = myNFT.tokenURI(0);
        assertEq(actualTokenURI, expectedTokenURI, "The tokenURI does not match the expected value.");
    }
}
