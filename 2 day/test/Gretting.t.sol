// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {Gretting} from "../src/Gretting.sol";

contract TestGreet is Test {
    Gretting public greeting;

    function setUp() public {
        greeting = new Gretting();
    }

    function testSetInfo() public {
        greeting.setInfo("Vivek Nath", "I am in the 15 days of foundry challenge");
        (string memory name, string memory bio) = greeting.getInfo();
        assertEq(name, "Vivek Nath");
        assertEq(bio, "I am in the 15 days of foundry challenge");
    }

    function testGetInfo() public  {
        string memory name = "vivek";
        string memory bio = "Hey i am vivek";
        greeting.setInfo(name , bio);
        (name, bio) = greeting.getInfo();
        assertEq(name, "vivek");
        assertEq(bio, "Hey i am vivek");
    }

    function testUpdateName() public {
        greeting.setInfo("Vivek","hola it is web3");
        greeting.updateName("ramesh");
        greeting.updateBio("yehhh it's web3 buddy");
        assertEq(greeting.name(),"ramesh");
        assertEq(greeting.bio(),"yehhh it's web3 buddy");





       
    }
}
