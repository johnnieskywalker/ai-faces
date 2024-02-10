// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "../lib/forge-std/src/Test.sol";
import "../src/AiFaces.sol";

contract AiFacesTest is Test {
    AiFaces public myNFT;

    function setUp() public {
        vm.startPrank(address(this));
        myNFT = new AiFaces();
        vm.stopPrank();
    }

    function testMint() public {
        myNFT.mint(1);
        assertEq(myNFT.balanceOf(address(this)), 1);
    }

    function testTokenURI() public {
        myNFT.mint(1);
        string memory expectedTokenURI = "https://raw.githubusercontent.com/johnnieskywalker/ai-faces/main/pictures/0";
        string memory actualTokenURI = myNFT.tokenURI(0);
        assertEq(actualTokenURI, expectedTokenURI, "The tokenURI does not match the expected value.");
    }

    function testSetBaseURI() public {
        vm.startPrank(address(this));
        string memory newBaseURI = "https://newexample.com/";
        myNFT.setBaseURI(newBaseURI);
        vm.stopPrank();

        myNFT.mint(2);
        string memory expectedNewTokenURI = "https://newexample.com/1";
        string memory actualNewTokenURI = myNFT.tokenURI(1);

        assertEq(
            actualNewTokenURI,
            expectedNewTokenURI,
            "The tokenURI after base URI update does not match the expected value."
        );
    }
}
