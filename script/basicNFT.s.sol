// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../contracts/src/basicNFT.sol";

contract BasicNFTScript is Script {
    BasicNFT nftContract;

    function deploy() public {
        nftContract = new BasicNFT();
    }

    function mintAll() public {
        // Mint 21 NFTs.
        nftContract.mintAll("0x", 21);
    }
}
