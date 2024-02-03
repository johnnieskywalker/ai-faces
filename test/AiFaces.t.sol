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
}
