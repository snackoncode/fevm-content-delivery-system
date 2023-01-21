// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract contentRegistry is ERC721, ReentrancyGuard, Ownable {
  using Counters for Counters.Counter;

  using Strings for uint256;

  constructor(string memory IPFSGatewayURI_) ERC721("contentRegistry", "CDNR") {
    customBaseURI = IPFSGatewayURI_;
  }

  /** TOKEN PARAMETERS **/
  //must be defined upon registration (aka mint)//
  //mint function requires truncated input ex: ["metadataSchemeType","IPFS_JSON","ownerAddress"]

  struct TokenParameters {
    uint256 metadataSchemeType;
    string IPFS_JSON;
    address ownerAddress;
  }

  mapping(uint256 => TokenParameters) private tokenParametersMap;

  //each tokenized registration is assigned an id in the order they were registered ("minted")
  //this public function allows users to read data for each registration by passing the tokenID
  
  function tokenParameters(uint256 tokenId) external view
    returns (TokenParameters memory)
  {
    return tokenParametersMap[tokenId];
  }

  /** MINTING **/

  Counters.Counter private supplyCounter;

  //mint function assign mapping of tokenID with parameters
  function mint(TokenParameters calldata parameters) public nonReentrant {
    require(registrationIsActive, "Registration not active");

    uint256 id = totalSupply();

    _mint(msg.sender, id);

    tokenParametersMap[id] = parameters;

    supplyCounter.increment();
  }


  function totalSupply() public view returns (uint256) {
    return supplyCounter.current();
  }

  /** ACTIVATION **/

  bool public registrationIsActive = true;

  function setregistrationIsActive(bool registrationIsActive_) external onlyOwner {
    registrationIsActive = registrationIsActive_;
  }

  /** URI HANDLING **/

  string private customBaseURI;

  function setBaseURI(string memory IPFSGatewayURI_) external onlyOwner {
    customBaseURI = IPFSGatewayURI_;
  }

  function _baseURI() internal view virtual override returns (string memory) {
    return customBaseURI;
  }
}