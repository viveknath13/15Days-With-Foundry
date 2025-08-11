// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {Gretting} from "../src/Gretting.sol";

contract Deploy is Script {
    function run() public returns (Gretting) {
        vm.startBroadcast();
        Gretting gretting = new Gretting();
        vm.stopBroadcast();
        return gretting;
    }
}

//0x5FbDB2315678afecb367f032d93F642f64180aa3
