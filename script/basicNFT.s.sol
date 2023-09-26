// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../contracts/src/basicNFT.sol";

contract BasicNFTScript is Script {
    basicNFT nftContract;
    function deployContract() public {
        nftContract = new basicNFT();
    }

    function run() public {
        uint private_key = vm.envUint("PRIVATE_KEY");
        address account = vm.addr(private_key);
        console.log("Account : ", account);

        vm.startBroadcast(private_key);
        // Check if the contract has already been deployed.
        if (address(nftContract) == address(0)) {
            deployContract();
        }

        nftContract.mintAll("0x", 4);
        
        vm.stopBroadcast();
    }
}
