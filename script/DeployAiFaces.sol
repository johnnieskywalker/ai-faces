// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "../src/AiFaces.sol";

contract DeployAiFaces {
    AiFaces public aiFacesInstance;

    function deploy() public {
        aiFacesInstance = new AiFaces();
    }
}
