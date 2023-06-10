library moralis;

import 'EVM/evmapi.dart';
import 'constant/constant.dart';

/// Moralis
class Moralis {
  static setApiKey({required String apikey}) {
    apiKey = apikey;
  }

  static EvmApi evmApi = EvmApi();
}
