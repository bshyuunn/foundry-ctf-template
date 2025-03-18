// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

import {Setup} from "../src/Setup.sol";
import {SimpleChallenge} from "../src/SimpleChallenge.sol";

// forge script solveSimpleChallenge --broadcast
contract solveSimpleChallenge is Script {
    uint256 public playerPrivateKey;
    address public player;

    Setup public setupContract;

    function setUp() external {
        string memory rpcUrl = "http://localhost:8545/0537464e-f5cf-4ece-975a-5b1bed09b1ef";
        playerPrivateKey = 0x281e21a56b9efad01867a004885aded61bdf6db838a8a6ff5e28a23f98573234;
        setupContract = Setup(0x0F82254CE9905C028C148Ee8954A80471b38779B);

        player = vm.addr(playerPrivateKey);
        vm.createSelectFork(rpcUrl);
    }

    function run() external {
        vm.startBroadcast(playerPrivateKey);

        SimpleChallenge simpleChallengeInstance =  setupContract.simpleChallengeContract();
        simpleChallengeInstance.solve();

        console.log("setupContract.isSolved(): ", setupContract.isSolved());

        vm.stopBroadcast();
    }
}
