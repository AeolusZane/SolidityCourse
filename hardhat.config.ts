import "hardhat-gas-reporter"
import "@nomicfoundation/hardhat-toolbox";
import "@nomicfoundation/hardhat-ethers";
const dotenv = require('dotenv');
dotenv.config();
type Config = import('hardhat/config').HardhatUserConfig

const config: Config = {
  solidity: "0.8.24",
  networks: {
    hardhat: {
      chainId: 31337
    },
    // 如果没有配置环境变量，这里先注释掉执行
    // sepolia_eth: {
    //   url: `https://eth-sepolia.g.alchemy.com/v2/${process.env.ALCHEMY_API_KEY}`,
    //   accounts: [process.env.PRIVATE_KEY]
    // }
  },
  gasReporter: {
    enabled: true
  }
};

export default config;
