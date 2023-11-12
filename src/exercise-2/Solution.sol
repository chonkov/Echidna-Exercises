// SPDX-License-Identifier: MIT
pragma solidity =0.7.0;

import {Token} from "./Exercise-2.sol";

contract TestToken is Token {
    constructor() {
        pause(); // pause the contract
        owner = address(0); // lose ownership
    }

    function echidna_cannot_be_unpause() public view returns (bool) {
        return paused();
    }
}
