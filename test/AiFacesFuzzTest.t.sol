// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "../lib/forge-std/src/Test.sol";
import "../src/AiFaces.sol";

contract AiFacesFuzzTest is Test {
    AiFaces public myNFT;

    function setUp() public {
        vm.startPrank(address(this));
        myNFT = new AiFaces();
        vm.stopPrank();
    }

    function testFuzzMintRespectsMaxSupply(uint256 quantity) public {
        uint256 maxSupply = 107;
        uint256 currentSupply = myNFT.totalSupply();
        uint256 remainingSupply = maxSupply - currentSupply;

        // Skip test cases where quantity is zero or would exceed the remaining supply
        // It's already covered by unit test
        if (quantity == 0 || quantity > remainingSupply) return;

        // Attempt to mint the fuzzed quantity of tokens
        myNFT.mint(quantity);

        // Verify the total supply has increased by the minted quantity
        assertEq(myNFT.totalSupply(), currentSupply + quantity);

        // Further, try to mint one more token beyond the max supply and expect it to revert
        if (currentSupply + quantity == maxSupply) {
            vm.expectRevert("Exceeds maximum supply");
            myNFT.mint(1);
        }
    }
}
