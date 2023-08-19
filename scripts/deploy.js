const { ethers } = require("hardhat");

async function main() {
  const Token = await ethers.getContractFactory("FarmXToken");
  const token = await Token.deploy();

  console.log("FarmXToken deployed to:", token.address);

  // Log the contract's ABI
  console.log("FarmXToken ABI:", JSON.stringify(Token.interface.abi, null, 2));
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
