/**
 * @type import('hardhat/config').HardhatUserConfig
 */
require("@nomiclabs/hardhat-waffle");
module.exports = {
  networks: {
    hardhat: {
      chainId: 1337
    }
  },
  solidity: "0.8.4", // Adjust the Solidity version as needed
};
