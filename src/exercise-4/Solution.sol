// SPDX-License-Identifier: MIT
pragma solidity =0.7.0;

import {Token} from "./Exercise-4.sol";

contract TestToken is Token {
    function transfer(address to, uint256 value) public override {
        uint256 beforeBal0 = balances[msg.sender];
        uint256 beforeBal1 = balances[to];

        super.transfer(to, value);

        uint256 afterBal0 = balances[msg.sender];
        uint256 afterBal1 = balances[to];

        assert(afterBal0 <= beforeBal0);
        assert(afterBal1 >= beforeBal1);
    }
}
