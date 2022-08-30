# Sample Hardhat Project

inspided by https://www.youtube.com/watch?v=ynFNLBP2TPs

npx hardhat run scripts/deploy.js --network rinkeby
npx hardhat verify --network rinkeby <<DEPLOYED_CONTRACT_ADDRESS>>

formato uri:
ipfs://QmUewqV2cZZ7WqVxoCoCM3sjdBo9QWo8MUSqo5GYAXMSPi/

royalties:
Parece que los marketplaces se encargan de llevar a cabo esta operación.
Exite un estandard (EIP-2891) que se encarga de estandarizar esta informacion, ojo la info no el proceso de cobro de los royalties.
Puedes
https://stackoverflow.com/questions/71513603/can-not-set-opensea-io-royalties-on-a-nft-contract
https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721Royalty.sol
https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/common/ERC2981.sol

https://www.youtube.com/watch?v=_-D-8rNraUE



This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
GAS_REPORT=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```
