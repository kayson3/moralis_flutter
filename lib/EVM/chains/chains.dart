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
  arbitrum,
}

class ChainDetails {
  final int id;
  final String name;

  ChainDetails(this.id, this.name);
}

class EvmChainHelper {
  static final Map<EvmChain, ChainDetails> _chainDetails = {
    EvmChain.ethereum: ChainDetails(1, 'eth'),
    EvmChain.ropsten: ChainDetails(3, 'ropsten'),
    EvmChain.rinkeby: ChainDetails(4, 'rinkeby'),
    EvmChain.goerli: ChainDetails(5, 'goerli'),
    EvmChain.kovan: ChainDetails(42, 'kovan'),
    EvmChain.sepolia: ChainDetails(11155111, 'sepolia'),
    EvmChain.polygon: ChainDetails(137, 'polygon'),
    EvmChain.mumbai: ChainDetails(80001, 'mumbai'),
    EvmChain.bsc: ChainDetails(56, 'bsc'),
    EvmChain.bsctestnet: ChainDetails(97, 'bsc_testnet'),
    EvmChain.avalanche: ChainDetails(43114, 'avalanche'),
    EvmChain.fantom: ChainDetails(250, 'fantom'),
    EvmChain.cronos: ChainDetails(25, 'cronos'),
    EvmChain.palm: ChainDetails(11297108109, 'palm'),
    EvmChain.arbitrum: ChainDetails(42161, 'arbitrum'),
  };

  ///if the chaintype isn't found, getChainId will return -1.
  static int getChainId(EvmChain chaintype) {
    return _chainDetails[chaintype]?.id ?? -1;
  }
  ///if the chaintype isn't found, getChainName will return an empty string ('').
  static String getChainName(EvmChain chaintype) {
    return _chainDetails[chaintype]?.name ?? '';
  }
}