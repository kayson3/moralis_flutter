library moralis;

import 'EVM/evmapi.dart';
import 'constant/constant.dart';

/// Moralis
class Moralis {
  late final EvmApi evmApi;

  Moralis({EvmApi? evmApi}) : evmApi = evmApi ?? EvmApi();

  static void setApiKey({required String apikey}) {
    Constants.apiKey = apikey;
  }
}
