import 'dart:convert';
import '../../constant/constant.dart';
import 'package:http/http.dart' as http;
import '../chains/chains.dart';

class NFT {
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

  Future<List?> getNFT({
    required EvmChain chain,
    required String address,
  }) async {
    final String chainn = EvmChainHelper.getChainName(chaintype: chain);
    final Map<String, String> parameters = {
      "chain": chainn,
    };
    try {
      final response = await _fetch("$address/nft", parameters: parameters);
      final resData = jsonDecode(response.body);
      // Constants.logger.d(resData);
      if (response.statusCode != 200) {
        Constants.logger.w(resData["message"]);
        throw resData["message"];
      } else {
        return resData["result"];
      }
    } catch (error) {
      Constants.logger.w(error);
      return null;
    }
  }
}
