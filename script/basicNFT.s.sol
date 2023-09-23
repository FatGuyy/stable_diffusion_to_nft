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

        bytes memory data = abi.encodePacked('{');
        data = abi.encodePacked(data, '"name": "Image 1",');
        data = abi.encodePacked(data, '"description":" abstract art",');
        data = abi.encodePacked(data, '"image": "ipfs://QmQdkFj49dRKmu7uo3jKdgU721QNe2srKNU7zZyPeBLzcN/1.png"');
        data = abi.encodePacked(data, '}');
        nftContract.mintAll(data, 5);
        
        vm.stopBroadcast();
    }
}

//   basicNFT nftContract;


//     // Mint NFTs.
//     bytes memory data = abi.encodePacked('{');
//     data = abi.encodePacked(data, '"name": "Image 1",');
//     data = abi.encodePacked(data, '"description":" abstract art",');
//     data = abi.encodePacked(data, '"image": "ipfs://QmQdkFj49dRKmu7uo3jKdgU721QNe2srKNU7zZyPeBLzcN/1.png"');
//     data = abi.encodePacked(data, '}');

//     nftContract.mintAll(data, 5);
// }

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

