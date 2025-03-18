// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {SimpleChallenge} from "./SimpleChallenge.sol";

contract Setup {
    SimpleChallenge public simpleChallengeContract;

    constructor() {
        simpleChallengeContract = new SimpleChallenge();
    }

    function isSolved() public view returns (bool) {
        return simpleChallengeContract.solved() == true;
    }

}