// SPDX-License-Identifier: MIT
pragma solidity =0.7.0;

import {MintableToken} from "./Exercise-3.sol";

contract TestToken is MintableToken {
    address echidna = msg.sender;

    constructor() MintableToken(10_000) {
        owner = echidna;
    }

    function echidna_test_balance() public view returns (bool) {
        return balances[msg.sender] <= 10_000;
    }
}
