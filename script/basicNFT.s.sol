// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../contracts/src/basicNFT.sol";

contract BasicNFTScript is Script {
    basicNFT nftContract;

    function run() public {
        uint private_key = vm.envUint("PRIVATE_KEY");
        address account = vm.addr(private_key);
        console.log("Account : ", account);

        vm.startBroadcast(private_key);
        
        nftContract = new basicNFT();
        nftContract.mintAll(abi.encode(account), 5);
        
        vm.stopBroadcast();
    }
}

// pragma solidity ^0.8.0;

// import "forge-std/Script.sol";
// import "../contracts/src/basicNFT.sol";

// contract BasicNFTScript is Script {
//     BasicNFT nftContract;

//     function deploy() public {
//         nftContract = new BasicNFT();
//     }

//     function mintAll(address _account) public {
//         bytes memory accountBytes = abi.encodePacked(_account);
//         // Mint 5 NFTs.
//         nftContract.mintAll(accountBytes, 5);
//     }

//     function run() public {
//         uint private_key = vm.envUint("PRIVATE_KEY");
//         address account = vm.addr(private_key);
//         console.log("Account : ", account);

//         vm.startBroadcast(private_key);
        
//         deploy();
//         mintAll(account);
        
//         vm.stopBroadcast();
//     }
// }

