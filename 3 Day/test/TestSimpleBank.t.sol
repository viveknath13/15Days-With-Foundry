// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {SimpleBank} from "../src/simpleBank.sol";

contract TestSimpleBank is Test {
    SimpleBank public bank;

    function setUp() public {
        bank = new SimpleBank("Simple Bank");
    }

    function testDeposit() public {
        address user = makeAddr("user");
        vm.deal(user, 10 ether);
        vm.prank(user);
        bank.deposit{value: 1 ether}();
        vm.prank(user);
        assertEq(bank.getCustomerBalance(), 1 ether);
    }

    function testWithdraw() public {
        address user = makeAddr("user");
        vm.deal(user, 10 ether);
        vm.prank(user);
        bank.deposit{value: 1 ether}();
        vm.prank(user);
        bank.withdraw(user, 0.5 ether);
        vm.prank(user);
        assertEq(bank.getCustomerBalance(), 0.5 ether);
    }

    function testWithdrawInsufficientBalance() public {
        address user = makeAddr("user");
        vm.deal(user, 10 ether);
        vm.prank(user);
        bank.deposit{value: 1 ether}();
        vm.expectRevert(SimpleBank.InsufficientBalance.selector);
        bank.withdraw(user, 2 ether);
    }
}
