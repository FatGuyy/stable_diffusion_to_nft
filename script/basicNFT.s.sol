// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/basicNFT.sol";

contract BasicNFTScript is Script {
    basicNFT nftContract;
    string nftMetadata;   
    constructor() {
        nftMetadata = vm.envString("NFT_METADATA");
    } 
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
        nftContract.mintAll(nftMetadata,"0x", 4); 
        vm.stopBroadcast();
    }
}

// forge script script/BasicNFTScript.sol --rpc-url $RPC_URL 
// --private-key $PRIVATE_KEY -- --NFT_METADATA ipfs://QmXPvQwX5B9cuZ7vhQLsY5YJjt6BWvz5f48ihDuDvMKFau/