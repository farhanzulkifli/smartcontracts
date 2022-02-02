// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract farhan_erc721 is ERC721URIStorage, Pausable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;

    constructor() ERC721("farhan_ERC721", "FHN721") {}

    function mint(address to) public whenNotPaused {

        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(to, newItemId);
        _setTokenURI(newItemId, "https://ipfs.io/ipfs/bafkreiftrrzzhsla33jwcvj3feybzcvxw6lbb3oeqjlmso3td7wgzu64py");

    }

    function burn(uint256 tokenId) public whenNotPaused {
        _burn(tokenId);
    }

    function pause() public virtual {
        _pause();
    }

    function unpause() public virtual {
        _unpause();
    }
    
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override(ERC721) {
        super._beforeTokenTransfer(from, to, tokenId);
    }
}
