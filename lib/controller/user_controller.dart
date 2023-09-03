import 'package:flutter_application/model/base_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/user.dart';

class UserController {
  final String baseUrl = dotenv.get("BASE_URL");

  Future<User> fetchUserInfo(int index) async {
    String _url = '${baseUrl}/users/${index}';
    final response = await http.get(Uri.parse(_url));

    var responseBody = utf8.decode(response.bodyBytes);
    Map responseMap = jsonDecode(responseBody);

    var Bruser = BaseResponse.fromJson(responseMap);

    return User.fromJson(Bruser.result);
  }
}
