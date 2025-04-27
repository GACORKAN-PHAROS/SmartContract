// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Vault} from "./Vault.sol"; // kontrak vault yang menyediakan fungsi deposit withdraw, dan distribusi yield
import {IERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol"; 

contract YieldzAVS {
    Vault public vault;

    constructor(address _vault) { // Alamat vault disimpan dalam _vault
        vault = Vault(_vault); // vairabel yang berisi dar i vault token dasar
    }

    function manageFund(uint256 amount) public { // sebuah fungsi bernama manageFund dengan isian berupa nilai "amount"
        IERC20 underlyingToken = IERC20(vault.token()); // (vault.token()) -> mengembalikkan alamat token dasar yang digunakan vault
        require(
            underlyingToken.transferFrom(msg.sender, address(this), amount), // memindahkan token dari "msg.sender" ke alamat kontrak "address(this)" sebesar "amount"
            "Transfer failed"
        );
        require(
            underlyingToken.approve(address(vault), amount), // memberikan persetujuan ke kontrak vault untuk mengakases token tersebut
            "Approval failed"
        );
        vault.deposit(amount); // memanggil fungsi deposit pada vault dengan jumlah yang sama
    }
    function distributeYield(uint256 amount) public {
        IERC20 underlyingToken = IERC20(vault.token());// mendapatkan instance token ERC20 yang dapat digunakan oleh vault
        require(
            underlyingToken.transferFrom(msg.sender, address(this), amount), // memindahkan token dari "msg.sender" ke "address(this)" sejumlah "amount"
            "Transfer failed"
        );
        require(
            underlyingToken.approve(address(vault), amount), // memberikan persetujuan ke kontrak vault untuk mengakses token tersebut
            "Approval failed"
        );
        vault.distributeYield(amount); // memanggil fungsi distributeYield pada vault dengan jumlah yang sama
    }
}
