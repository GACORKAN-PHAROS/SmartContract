// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol"; // Mengimpor modul Script dari Foundry untuk membuat deployment script
import {Counter} from "../src/Counter.sol"; //Mengimpor kontrak Counter yang akan dideploy

contract CounterScript is Script { // Mendefinisikan script deployment yang mewarisi dari Script dari Foundry.
    Counter public counter; //deklarasi untuk menyimpan instance (implementasi dari sebuah project)

    // function setUp() public {} // Fungsi kosong yang biasanya digunakan untuk inisialisasi dalam testing (tidak digunakan di sini).
    // biasanya digunakan untuk inisialisasi variabel baru yang digunakan dalam testing (counter = new Counter())

    function run() public { // script utama yang akan dijalankan ketika script dieksekusi
        vm.startBroadcast(); //Memulai mode broadcast yang menandakan bahwa transaksi berikutnya akan benar-benar dikirim ke jaringan.

        counter = new Counter(); // Mendeploy kontrak Counter baru dan menyimpan instancenya dalam variabel counter.

        vm.stopBroadcast(); //mengakhiri mode broadcast
    }
}
/*Script ini memiliki satu tujuan utama: mendeploy kontrak Counter ke jaringan blockchain.
Script deployment seperti ini sangat berguna dalam pengembangan smart contract untuk:

Otomatisasi proses deployment

Deployment ke berbagai jaringan (testnet/mainnet) dengan config yang konsisten

Integrasi dengan alur kerja CI/CD
     */
