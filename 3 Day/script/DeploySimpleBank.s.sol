// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {SimpleBank} from "../src/simpleBank.sol";

contract DeploySimpleBank is Script {
    function run() public returns (SimpleBank) {
        vm.startBroadcast();
        SimpleBank bank = new SimpleBank("Web3 Bank");
        vm.stopBroadcast();
        console.log("Bank Deployed at : ", address(bank));
        return bank;
    }
}
