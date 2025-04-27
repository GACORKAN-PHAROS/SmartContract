// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter(); // membuat instance baru dari contract Counter
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment(); // ditambah untuk memodifikasi state variabel dalam smart contract, dalam konteks ini menghitung jumlah transaksi, jumlah user yang mendaftar,
        assertEq(counter.number(), 1); // memverifikasi nilai menjadi 1
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x); // memverifikasi nilai menjadi x
    }
}
