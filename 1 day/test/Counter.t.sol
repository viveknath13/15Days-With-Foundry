// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
       
    }

    function testIncrement() public {
        counter.setNumber(20);
        counter.increment();
        assertEq(counter.number(), 21);
    }

    function testNumber() public   {
        counter.setNumber(100);
        counter.number();
        assertEq(counter.number(), 100);
    }


    function testDecrement() public {
        counter.setNumber(10);
        counter.decrement();
        console.log(counter.number());
         assertEq(counter.decrement(),9);
    }


    
}
