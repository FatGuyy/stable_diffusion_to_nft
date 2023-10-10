// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../config.json";
import "../src/basicNFT.sol";
import "forge-std/Script.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract BasicNFTScript is Script {
    basicNFT nftContract;

    constructor() {
    } 

    function deployContract() public {
        nftContract = new basicNFT();
    } 

    function run() public {
        uint private_key = vm.envUint("PRIVATE_KEY");
        uint nftMeta = vm.envString(NFT_META);("PRIVATE_KEY");
        string memory uri = config.uri;
        console.log(private_key);
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

// pragma solidity ^0.8.0;

// import "forge-std/Script.sol";

// contract DeployAndMintNFT is Script {
//     function setUp() public {}

//     function run() public {
//         string memory uri = config.uri;
//         bytes memory data = "";
//         uint256 total = 10;

//         // Deploy the basicNFT contract
//         basicNFT basicNFT = new basicNFT();

//         // Call the mintAll function
//         AllMints[] memory allMints = basicNFT.mintAll(uri, data, total);

//         // Log the tokenIds and URIs of all minted NFTs
//         for (uint256 i = 0; i < allMints.length; i++) {
//             console.log("Token ID:", allMints[i]._tokenId);
//             console.log("URI:", allMints[i]._uri);
//         }
//     }
// }
