// SPDX-License-Identifier: MIT
pragma solidity =0.7.0;

import {Token} from "./Exercise-1.sol";

contract TestToken is Token {
    address echidna_caller = msg.sender;

    constructor() {
        balances[echidna_caller] = 10_000;
    }

    function echidna_test_balance() public view returns (bool) {
        return balances[echidna_caller] <= 10_000;
    }
}
