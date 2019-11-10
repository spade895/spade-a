const path = require("path");
const HDWalletProvider = require("truffle-hdwallet-provider");
// 提供助记词（mnemonic）来生成你的账户
const  mnemonic = "fluid cruise hire farm relax tone bless joke dilemma cushion senior detail";
module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
     ropsten: {
      provider: function() {
       return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/b9f457e843804c40b9bddc1db7903cc7")
      },
      network_id: 3
    },
    mainnet: {
      gas: 7500000,
      gasPrice: 6000000000,
      provider: function() {
          return new HDWalletProvider(mnemonic,
              "https://mainnet.infura.io/v3/b9f457e843804c40b9bddc1db7903cc7")
      },
      network_id: 1

  },
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*" // Match any network id
    },
    develop: {
      port: 8545
    }
  }
};
