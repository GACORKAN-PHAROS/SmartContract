// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter { //smart contract bernama Counter
    uint256 public number; 

    function setNumber(uint256 newNumber) public { // contract untuk mengatur nilai number ke nilai baru
        number = newNumber;
    }

    function increment() public { // contract untuk menambahkan nilai number menjadi number+1
        number++;
    }
}

/* Tujuan dari Smart contract Counter
1. Demonstrasi dasar smart contract yang menyimpan dan memodifikasi data di blockchain
2. Menyediakan contoh sederhana bagaimana state variable bekerja di Solidity
3. Menunjukkan operasi dasar: penyimpanan nilai dan increment 

 -> Contract ini bisa digunakan sebagai:
1. Dasar untuk memahami cara kerja state variable di Solidity
2. Komponen dasar untuk contract yang membutuhkan counter
3. Contoh awal dalam pembelajaran pengembangan smart contract
*/