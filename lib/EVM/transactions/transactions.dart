import 'dart:convert';
import '../../constant/constant.dart';
import 'package:http/http.dart' as http;
import '../chains/chains.dart';
import 'models/model.dart';

class Transactions {
  final _client = http.Client();

  Future<http.Response> _fetch(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, String>? parameters,
  }) async {
    final uri = Uri.parse("${Constants.baseurl}/$endpoint")
        .replace(queryParameters: parameters);
    return _client.get(
      uri,
      headers: {
        "accept": "application/json",
        "X-API-Key": Constants.apiKey,
        if (headers != null) ...headers,
      },
    );
  }

  Future<List<Transaction>> getTransactionByWallet({
    required String address,
    required EvmChain chain,
  }) async {
    final String chainName = EvmChainHelper.getChainName(chaintype: chain);
    try {
      final response = await _fetch(address, parameters: {"chain": chainName});
      final responseData = jsonDecode(response.body);
      Constants.logger.d(responseData);
      if (response.statusCode != 200) {
        Constants.logger.w(responseData["message"]);
        throw responseData["message"];
      } else {
        if (responseData is Map<String, dynamic>) {
          final apiResponse = ApiResponse.fromJson(responseData);
          final transactions = apiResponse.result;
          if (transactions != null && transactions.isNotEmpty) {
            return transactions;
          }
        }
      }
    } catch (error) {
      Constants.logger.w(error);
      return [];
    }
    return [];
  }
}
