// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Vault} from "../src/Vault.sol";
import {YieldzAVS} from "../src/YieldzAVS.sol";
import {MockUSDC} from "../src/MockUSDC.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract VaultTest is Test {
    Vault public vault;
    YieldzAVS public yieldzAVS;
    MockUSDC public mockUSDC;

    address operator1 = makeAddr("operator1");

    function setUp() public {
        mockUSDC = new MockUSDC();
        vault = new Vault(address(mockUSDC));
        yieldzAVS = new YieldzAVS(address(vault));
 
    }

    function test_deposit() public {
      mockUSDC.mint(address(this), 1_000_000); // == 1 usdc
      mockUSDC.approve(address(vault), 1_000_000);
      // mockUSDC.transfer(address(vault), 1_000_000);
      vault.deposit(1_000_000);

      vm.startPrank(address(vault));
      IERC20(vault.token()).approve(operator1, 1_000_000);
      vm.stopPrank();

      // // AVS
      vm.startPrank(operator1);
      IERC20(vault.token()).transferFrom(address(vault), operator1, 500_000);
      IERC20(vault.token()).approve(address(yieldzAVS), 500_000);
      yieldzAVS.manageFund(500_000);

      // Distribute yield
      IERC20(vault.token()).transferFrom(address(vault), operator1, 500_000);
      IERC20(address(mockUSDC)).approve(address(yieldzAVS), 500_000);
      yieldzAVS.distributeYield(500_000);
    }


}
