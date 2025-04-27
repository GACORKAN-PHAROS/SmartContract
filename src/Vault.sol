// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20,IERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Vault is ERC20 { // Contract bernama Vault yang mewarisi ERC20 dengan standar dari oppenzeppelin
    IERC20 public immutable token; // variabel token menyimpan alamat dari token, menggunakan IERC20 karena mampu menerima semua token yang mengimplementasikan standar ERC20

    constructor(address _token) ERC20("Yield Vault", "YVAULT") { // fungsi yang hanya dijalankan sekali saat deploy kontrak, _token = alamat token dasar yang akan disimpan di vault
        token = IERC20(_token); // set variabel token dengan alamat dari token dasar yang disimpan di vault (_token)
    }

// memasukkan token ke vault dan menerima token vault sebagai representasi
    function deposit(uint256 amount) public { 
        // shares = amount * total shares / total assets   [amount adalah token asli yang akan dikembalikan ke user saat withdraw]
        uint256 shares = 0; // menghindari bug dan sudah default
        uint256 totalAssets = token.balanceOf(address(this));
        uint256 totalShares = totalSupply();

        if (totalShares == 0) {
            shares = amount;
        } else {
            shares = amount * totalShares / totalAssets;
        }

        _mint(msg.sender, shares);
        token.transferFrom(msg.sender, address(this), amount);
    }

    function withdraw(uint256 shares) public {
 
      uint256 totalShares = totalSupply();
      uint256 totalAssets = token.balanceOf(address(this));
      uint256 amount = shares * totalAssets / totalShares;

      _burn(msg.sender, shares); // menghapus token dalam vault sebuah address
      token.transfer(msg.sender, amount);
    }

    function distributeYield(uint256 amount) public { // menambahkan keuntungan ke vault sebuah address
        token.transferFrom(msg.sender, address(this), amount);
    }
 
}
/*Kode ini adalah sebuah kontrak vault (brankas) berbasis ERC20 yang memungkinkan pengguna menyimpan token ERC20 dan menerima token representasi (shares) sebagai imbalan. */