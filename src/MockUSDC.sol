// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol"; // Standar ERC20 dari git tertera

contract MockUSDC is ERC20 { // Kontrak MockUSDC mewarisi inherits dari ERC20 yang sudah di-standarisasi (sifat dan perilakunya sama)
    constructor() ERC20("Mock USDC", "USDC") {} // Saat kontrak ini di deploy kode akan memanggil konstruktor dari ERC20 dengan parameter MockUSC(nama token), USDC(simbol token)
    
    function mint(address to, uint256 amount) public { 
        _mint(to, amount);
    }
    // Fungsi Mint memungkinkan siapapun untuk membuat/mencetak (mint) token baru dan mengirimkannya ke alamat (to) tertentu -> dengan jumlah (amount) tertentu 
}

/*Kontrak ini dibuat untuk:

Mensimulasikan token USDC di lingkungan pengembangan/testnet

Memungkinkan pengembang untuk mencetak token USDC tiruan secara gratis untuk keperluan testing

Mengimplementasikan standar ERC20 dasar dengan fungsi mint yang terbuka (public) */