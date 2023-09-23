// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/utils/Strings.sol';

string constant name = "BasicNFT";
string constant symbol = "BNFT";

contract basicNFT is ERC721(name, symbol), Ownable{
    using Strings for uint256;
    uint256 public totalSupply;
    address owner;

    // Array holding each NFT's tokenId and uri
    struct AllMints {
        uint256 _tokenId;
        string _uri;
    }

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, 'Must be BasicNFT deployer');
        _;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        // return "https://ipfs.io/ipfs/QmSrSwboxekwhUfK5nKcbzK6xuTmNxhsiz643pmjqJfqPt/";
        return "https://purple-personal-aardwolf-642.mypinata.cloud/ipfs/QmQdkFj49dRKmu7uo3jKdgU721QNe2srKNU7zZyPeBLzcN/";
    }

    function baseURI() public view returns (string memory) {
        return _baseURI();
    }

    // The Function which mints the ERC721 tokens according to the owner input in loop
    function mintAll(bytes memory data, uint256 total) onlyOwner public payable returns 
    (AllMints[] memory) {
        AllMints[] memory allMints = new AllMints[](total + 1);
        for (uint256 i = 1; i < (total + 1); i++) {
            string memory _uri = string(
                abi.encodePacked(_baseURI(), Strings.toString(i), ".jpg")
            );
            _safeMint(msg.sender, i, data);
            allMints[i] = AllMints(i, _uri);
            totalSupply++;
        }
        return allMints;
    }
}