// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";

import {Setup} from "../src/Setup.sol";
import {SimpleChallenge} from "../src/SimpleChallenge.sol";

// forge tset --mc testSimpleChallenge
contract testSimpleChallenge is Test {
    Setup public setupContract;
    SimpleChallenge public simpleChallengeContract;

    function setUp() public {
        setupContract = new Setup();
        simpleChallengeContract = setupContract.simpleChallengeContract();
    }

    function test_solve() public {
        simpleChallengeContract.solve();

        assertEq(setupContract.isSolved(), true);
    }
}