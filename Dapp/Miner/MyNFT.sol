// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.3.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.3.2/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.3.2/access/Ownable.sol";
import "@openzeppelin/contracts@4.3.2/utils/Counters.sol";

contract MyNFT is ERC721, ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("MyNFT", "MTK") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://api.mynft.com/tokens/";
    }

    function safeMint(address to) public onlyOwner {
        _safeMint(to, _tokenIdCounter.current());
        _tokenIdCounter.increment();
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
