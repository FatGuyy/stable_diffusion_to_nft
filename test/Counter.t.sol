// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "forge-std/Test.sol";
import "../contracts/src/MyNFT.sol";

contract MyNFTTest is Test {
    MyNFT myNFT;

    function setUp() public {
        myNFT = new MyNFT();
    }

    function testMintNFT() public {
        string memory tokenURI = "https://example.com/token-1.json";

        // Mint an NFT to the owner of the test contract.
        uint256 newItemId = myNFT.mintNFT(msg.sender, tokenURI);

        // Assert that the NFT was minted successfully.
        assertEq(myNFT.balanceOf(msg.sender), 1);

        // Assert that the NFT has the correct token URI.
        assertEq(myNFT.tokenURI(newItemId), tokenURI);
    }
}
