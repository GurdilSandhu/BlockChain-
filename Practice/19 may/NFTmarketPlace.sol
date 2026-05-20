// NFT Marketplace Storage System
// Create a smart contract named NFTMarketplace.

// Create Struct
// NFT 

// tokenId

// creator

// owner

// price

// isListed

// isSold


// Use Mapping
// mapping(uint => NFT)


// Requirements

// Mint NFT

// List NFT for sale

// Buy NFT

// Transfer ownership

// Prevent buying already sold NFT

// Prevent non-owner listing

// Track total sales

// Get NFT details

// Return all listed NFTs

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NFTMarketplace {

    struct NFT {
        uint tokenId;
        address creator;
        address owner;
        uint price;
        bool isListed;
        bool isSold;
    }

    mapping(uint => NFT) public NFTs;

    uint[] public listedNFTs;

    uint public totalSales;
    uint public nextTokenId;


    function mintNFT() public {

        nextTokenId++;

        NFTs[nextTokenId] = NFT({
            tokenId: nextTokenId,
            creator: msg.sender,
            owner: msg.sender,
            price: 0,
            isListed: false,
            isSold: false
        });
    }


    function listNFT(uint _tokenId, uint _price) public {

        NFT storage nft = NFTs[_tokenId];

        require(nft.owner == msg.sender, "Not NFT owner");
        require(!nft.isSold, "NFT already sold");
        require(nft.isListed == false,"Already Listed");
        require(_price > 0, "Price must be greater than 0");

        nft.price = _price;
        nft.isListed = true;
        nft.isSold = false;

        listedNFTs.push(_tokenId);

    }


   function buyNFT(uint _tokenId) public payable {

    NFT storage nft = NFTs[_tokenId];

    require(nft.tokenId != 0, "NFT does not exist");
    require(nft.isListed, "NFT not listed");
    require(msg.sender != nft.owner, "You already own this NFT");
    require(msg.value == nft.price, "Incorrect price");

    address previousOwner = nft.owner;

    payable(previousOwner).transfer(msg.value);

    nft.owner = msg.sender;
    nft.isListed = false;
    nft.isSold = true;
    nft.price = 0;

    totalSales++;
}


   function transferNFT(uint _tokenId, address _newOwner) public {

    NFT storage nft = NFTs[_tokenId];
    require(nft.tokenId != 0, "NFT does not exist");
    require(nft.owner == msg.sender, "Not NFT owner");
    require(_newOwner != address(0), "Invalid address");
    require(_newOwner != msg.sender, "Already owner");

    nft.owner = _newOwner;
    nft.isListed = false;
    nft.price = 0;
}

    function getNFT(uint _tokenId) public view returns (NFT memory) {

        return NFTs[_tokenId];
    }

    function getAllListedNFTs()public view returns (NFT[] memory){

        uint count = 0;
        for (uint i = 0; i < listedNFTs.length; i++) {

            if (NFTs[listedNFTs[i]].isListed) {
                count++;
            }
        }

        NFT[] memory listed = new NFT[](count);

        uint index = 0;

        for (uint i = 0; i < listedNFTs.length; i++) {

            if (NFTs[listedNFTs[i]].isListed) {

                listed[index] = NFTs[listedNFTs[i]];
                index++;
            }
        }

        return listed;
    }
}