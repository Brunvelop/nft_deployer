// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract PixVerses is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    uint256 public MAX_SUPPLY;
    uint256 public MAX_PER_WALLET;
    bool public isPublicMitEnabled;
    string internal baseTokenUri;
    address payable public withdrawWallet;

    constructor() payable ERC721("PixVerses", "PXV") {
        MAX_SUPPLY = 333;
        MAX_PER_WALLET = 1;
        // set witdraw wallet address
    }

    function setIsPublicMintEnabled(bool _isPublicMitEnabled) external onlyOwner {
        isPublicMitEnabled = _isPublicMitEnabled;
    }

    function setBaseTokenUri(string calldata _baseTokenUri) external onlyOwner {
        baseTokenUri = _baseTokenUri;
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        require(_exists(_tokenId), 'Token does not exist!');
        return string(abi.encodePacked(baseTokenUri, Strings.toString(_tokenId),'.json'));
    }

    function withdraw() external onlyOwner {
        (bool success, ) = withdrawWallet.call{ value: address(this).balance }('');
        require(success,'Withdraw failed');
    }

    function freeMint() public payable {
        require(isPublicMitEnabled, 'Minting is not enabled');
        require(balanceOf(msg.sender) < MAX_PER_WALLET, "Max Mint per wallet reached");
        require(_tokenIdCounter.current() <= MAX_SUPPLY , "I'm sorry we reached the cap");

        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);
    }
}