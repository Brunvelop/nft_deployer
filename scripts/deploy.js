const hre = require("hardhat");

async function main() {
  const PixVersesNFT = await hre.ethers.getContractFactory("NFT");
  const pixVersesNFT = await PixVersesNFT.deploy();

  await pixVersesNFT.deployed();

  console.log("Pixverse NFT deployed to:", pixVersesNFT.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
});
