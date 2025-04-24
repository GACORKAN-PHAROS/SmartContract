// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Vault} from "./Vault.sol";
import {IERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract YieldzAVS {
    Vault public vault;

    constructor(address _vault) {
        vault = Vault(_vault);
    }

    function manageFund(uint256 amount) public {
        IERC20 underlyingToken = IERC20(vault.token());
        require(
            underlyingToken.transferFrom(msg.sender, address(this), amount),
            "Transfer failed"
        );
        require(
            underlyingToken.approve(address(vault), amount),
            "Approval failed"
        );
        vault.deposit(amount);
    }
    function distributeYield(uint256 amount) public {
        IERC20 underlyingToken = IERC20(vault.token());
        require(
            underlyingToken.transferFrom(msg.sender, address(this), amount),
            "Transfer failed"
        );
        require(
            underlyingToken.approve(address(vault), amount),
            "Approval failed"
        );
        vault.distributeYield(amount);
    }
}
