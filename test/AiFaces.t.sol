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

    function testShouldIncreaseBalanceByOneWhenSingleTokenMinted() public {
        myNFT.mint(1);
        assertEq(myNFT.balanceOf(address(this)), 1);
    }

    function testShouldRetrieveCorrectTokenURI() public {
        myNFT.mint(1);
        // Assuming the base URI by default is from repo
        string memory expectedTokenURI =
            "https://raw.githubusercontent.com/johnnieskywalker/ai-faces/main/metadata/0.json";
        string memory actualTokenURI = myNFT.tokenURI(0);
        assertEq(actualTokenURI, expectedTokenURI, "The tokenURI should correctly reflect the token's metadata URI.");
    }

    function testShouldSetBaseURIWhenCalledByOwner() public {
        vm.startPrank(address(this));
        string memory newBaseURI = "https://newexample.com/";
        myNFT.setBaseURI(newBaseURI);
        vm.stopPrank();

        myNFT.mint(2);
        string memory expectedNewTokenURI = "https://newexample.com/1.json";
        string memory actualNewTokenURI = myNFT.tokenURI(1);

        assertEq(
            actualNewTokenURI,
            expectedNewTokenURI,
            "The tokenURI after base URI update does not match the expected value."
        );
    }

    function testMintExceedsMaxSupply() public {
        vm.expectRevert("Exceeds maximum supply");
        // Attempt to mint more than the MAX_SUPPLY
        myNFT.mint(108);
    }

    function testShouldRevertMintingWhenAttemptingToMintOneMoreAfterMaxSupplyReached() public {
        // First, mint up to the maximum supply
        uint256 maxSupply = 107;
        myNFT.mint(maxSupply);

        // Then, attempt to mint one more NFT and expect it to revert with "Exceeds maximum supply"
        vm.expectRevert("Exceeds maximum supply");
        myNFT.mint(1);
    }
}
