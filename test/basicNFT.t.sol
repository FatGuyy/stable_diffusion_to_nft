// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/basicNFT.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFTTest is Test {
    basicNFT nftContract;

    function setUp() public {
        nftContract = new basicNFT();
    }

    function testBaseURI() public {
        assertEq(nftContract.baseURI("ipfs://QmXPvQwX5B9cuZ7vhQLsY5YJjt6BWvz5f48ihDuDvMKFau/"), "ipfs://QmXPvQwX5B9cuZ7vhQLsY5YJjt6BWvz5f48ihDuDvMKFau/");
    }

    function testMintAll() public {
        // Mint 5 NFTs.
        basicNFT.AllMints[] memory allMints = nftContract.mintAll("ipfs://QmXPvQwX5B9cuZ7vhQLsY5YJjt6BWvz5f48ihDuDvMKFau/", "0x", 5);

        // Check the total supply of NFTs.
        assertEq(nftContract.totalSupply(), 5);

        // Check the balance of the deployer.
        assertEq(nftContract.balanceOf(msg.sender), 5);

        // Check the URI of the first NFT.
        assertEq(allMints[0]._uri, "https://purple-personal-aardwolf-642.mypinata.cloud/ipfs/QmQdkFj49dRKmu7uo3jKdgU721QNe2srKNU7zZyPeBLzcN/1.jpg");
    }

    function testOnlyOwnerCanMintAll() public {
        // Try to mint all NFTs as the user.
        vm.expectRevert("Must be BasicNFT deployer");
    }
}
