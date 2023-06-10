import 'dart:convert';

import 'package:http/http.dart' as http;

import 'constant/constant.dart';

Future<bool> signUp({email, password, country, referralcode}) async {
  var data = {
    "email": email,
    "password": password,
    "country": country,
    "device_id": '',
  };

  // return false;

  logger.d(data);
  try {
    final response = await http.post(
      Uri.parse("\$authBaseUrl/api/v1/auth/register"),
      headers: {
        "content-type": "application/json",
        "x-app": "true",
      },
      body: jsonEncode(data),
    );
    var resData = jsonDecode(response.body);

    logger.d(resData);
    if (resData["status"] != "success") {
      return false;
    } else {
      return true;
    }
  } catch (error) {
    logger.d(error);

    return false;
  }
}
