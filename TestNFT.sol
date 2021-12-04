// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract TestNFT is ERC721, ERC721Enumerable, ERC721URIStorage {
    using Counters for Counters.Counter;

    //  Unique token ID incrementer
    Counters.Counter private _tokenIds;

    // [tokenId] => address of the token owner
    mapping(uint256 => string) private _tokenURIs;

    constructor() ERC721("Test NFT", "TSN") {}

    function createNFT(address _to) external returns (uint256){
        _tokenIds.increment();
        uint256 newId = _tokenIds.current();
        _safeMint(_to, newId, "");
        _tokenURIs[newId] = "https://arweave.net/rb_iapYoySIubuxTOYLvb0ALCrXYbyS2oluZn8m-JBw";
        return newId;
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return _tokenURIs[tokenId];
    }

    function setTokenURI(uint256 tokenId, string memory uri) external {
        require(_exists(tokenId), "ERC721Metadata: URI assignment for nonexistent token");
        _tokenURIs[tokenId] = uri;
    } 
}
