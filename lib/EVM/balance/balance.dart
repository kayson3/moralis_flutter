import 'dart:convert';

import '../../constant/constant.dart';
import 'package:http/http.dart' as http;

import '../chains/chains.dart';

class Balance {
  ///The Balance API helps Web3 developers get the native balance for a specific wallet address.

  ///The Balance API provides out-of-the-box functionality for the most popular features when working with native balance (ETH, BNB, MATIC, CRO, etc.), including:

  /// Fetching native balance (native and USD)
  /// Fetching ERC20 owned by a given wallet
  /// Fetching ERC20 balances for a given wallet
  /// Fetching ERC20 transfers for a given wallet
  /// Support for all ERC20 tokens
  /// Real-time ERC20 token price discovery and metadata
  /// Plus so much more!

  get() {}

  /// Get balance for a single wallet address
  ///
  /// Returns a String
  Future<String?> getNativeBalance(
      {required EvmChain chain, required address}) async {
    int divideby = 1000000000000000000;

    String chainn = Evmchain.getChain(chaintype: chain);

    // logger.d(data);
    try {
      final response = await http.get(
        Uri.parse("$baseurl/$address/balance?chain=$chainn"),
        headers: {
          "accept": "application/json",
          "X-API-Key": apiKey,
        },
        // body: jsonEncode(data),
      );
      var resData = jsonDecode(response.body);

      logger.d(resData);
      if (response.statusCode != 200) {
        logger.w(resData["message"]);
        throw resData["message"];
      } else {
        return (int.parse(resData["balance"].toString().substring(0, 8)) /
                divideby)
            .toString();
      }
    } catch (error) {
      logger.w(error);

      return null;
    }
  }

  /// Get balance for multiple wallet addresses
  ///
  /// Returns a List of map containing
  /// * wallet address
  /// * balance
  /// * formatted balance
  Future<List?> getNativeBalanceMulti(
      {required EvmChain chain, required List<String> addresses}) async {
    String chainn = Evmchain.getChain(chaintype: chain);

    List touse = [];
    if (addresses.isNotEmpty) {
      touse = addresses.map((e) {
        return "&wallet_addresses=$e";
      }).toList();
    }

    // logger.d(data);
    try {
      final response = await http.get(
        Uri.parse("$baseurl/wallets/balances?chain=$chainn${touse.join()}"),
        headers: {
          "accept": "application/json",
          "X-API-Key": apiKey,
        },
        // body: jsonEncode(data),
      );
      var resData = jsonDecode(response.body);

      logger.d(resData);
      if (response.statusCode != 200) {
        logger.w(resData["message"]);
        throw resData["message"];
      } else {
        return resData[0]["wallet_balances"];
      }
    } catch (error) {
      logger.w(error);

      return null;
    }
  }
}
