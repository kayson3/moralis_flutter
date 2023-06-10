enum EvmChain {
  ethereum,
  ropsten,
  rinkeby,
  goerli,
  kovan,
  sepolia,
  polygon,
  mumbai,
  bsc,
  bsctestnet,
  avalanche,
  fantom,
  cronos,
  palm,
  arbitrum
}

class Evmchain {
  static getChainId({required EvmChain chaintype}) {
    switch (chaintype) {
      case EvmChain.ethereum:
        return 1;
      case EvmChain.ropsten:
        return 3;
      case EvmChain.rinkeby:
        return 4;
      case EvmChain.goerli:
        return 5;
      case EvmChain.kovan:
        return 42;
      case EvmChain.sepolia:
        return 11155111;
      case EvmChain.polygon:
        return 137;
      case EvmChain.mumbai:
        return 80001;
      case EvmChain.bsc:
        return 56;
      case EvmChain.bsctestnet:
        return 97;
      case EvmChain.avalanche:
        return 43114;
      case EvmChain.fantom:
        return 250;
      case EvmChain.cronos:
        return 25;
      case EvmChain.palm:
        return 11297108109;
      case EvmChain.arbitrum:
        return 42161;
    }
  }

  static String getChain({required EvmChain chaintype}) {
    switch (chaintype) {
      case EvmChain.ethereum:
        return 'eth';
      case EvmChain.ropsten:
        return EvmChain.ropsten.name;
      case EvmChain.rinkeby:
        return EvmChain.rinkeby.name;
      case EvmChain.goerli:
        return EvmChain.goerli.name;
      case EvmChain.kovan:
        return EvmChain.kovan.name;
      case EvmChain.sepolia:
        return EvmChain.sepolia.name;
      case EvmChain.polygon:
        return EvmChain.polygon.name;
      case EvmChain.mumbai:
        return EvmChain.mumbai.name;
      case EvmChain.bsc:
        return EvmChain.bsc.name;
      case EvmChain.bsctestnet:
        return 'bsc_testnet';
      case EvmChain.avalanche:
        return EvmChain.avalanche.name;
      case EvmChain.fantom:
        return EvmChain.fantom.name;
      case EvmChain.cronos:
        return EvmChain.cronos.name;
      case EvmChain.palm:
        return EvmChain.palm.name;
      case EvmChain.arbitrum:
        return EvmChain.arbitrum.name;
    }
  }
}
