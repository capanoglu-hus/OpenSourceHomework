//SPDX-License-Identifier : Unlicense
pragma solidity 0.8.17;

import "token/ERC721/ERC721Full.sol";
import "utils/Counters.sol";

contract StarkItem is ERC721Full {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    //adı stark sembolü stk olan nft 
    constructor() ERC721Full("STARK", "STK") public {
    }

    // oyuncu adresini ve token bilgilerini alıyor 
    function awardItem(address player, string memory tokenURI) public returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId); // NFT BASIYOR 
        _setTokenURI(newItemId, tokenURI); //NFT ID VE URI GÖNDERİYOR 

        return newItemId;
    }

    
}