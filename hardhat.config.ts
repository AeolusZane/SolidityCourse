import "@nomicfoundation/hardhat-toolbox";
import "@nomicfoundation/hardhat-ethers";

type Config = import('hardhat/config').HardhatUserConfig

const config: Config = {
  solidity: "0.8.24",
  networks: {
    hardhat: {
      chainId: 31337
    },
  }
};

export default config;
