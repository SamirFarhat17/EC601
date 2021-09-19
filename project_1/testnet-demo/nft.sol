pragma solidity 0.8.7;
 
import "ethereum-erc721-master/src/contracts/tokens/nf-token-metadata.sol";
import "ethereum-erc721-master/src/contracts/ownership/ownable.sol";

contract newNFT is NFTokenMetadata, Ownable {
 
  constructor() {
    nftName = "Synth NFT";
    nftSymbol = "SYN";
  }
 
  function mint(address _to, uint256 _tokenId, string calldata _uri) external onlyOwner {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
  }
 
}