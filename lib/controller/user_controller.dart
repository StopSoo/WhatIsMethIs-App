import 'package:flutter_application/model/base_response.dart';
import 'package:flutter_application/model/emergency_contact_req.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/user.dart';

class UserController {
  final String baseUrl = dotenv.get("BASE_URL");
  //Todo: 로그인 구현되면 받아오는걸로 수정하기
  final String accessToken = dotenv.get("ACCESS_TOKEN");

  Future<User> fetchUserInfo(int index) async {
    String _url = '${baseUrl}/users/${index}';
    final response = await http.get(Uri.parse(_url));

    var responseBody = utf8.decode(response.bodyBytes);
    Map responseMap = jsonDecode(responseBody);

    var Bruser = BaseResponse.fromJson(responseMap);

    return User.fromJson(Bruser.result);
  }
  //전화번호로 유저 조회
  Future<User> fetchUserInfoWithPhoneNumber(String phoneNumber) async {
   
    String _url = '${baseUrl}/users/phoneNumber?value=${phoneNumber}';
    final response = await http.get(Uri.parse(_url));

    var responseBody = utf8.decode(response.bodyBytes);
    Map responseMap = jsonDecode(responseBody);

    var Bruser = BaseResponse.fromJson(responseMap);

    return User.fromJson(Bruser.result);
  }

  //비상연락망 등록 및 삭제
  Future<void> patchEmergencyContact(EmergencyContactReq contacts) async {
    //Todo: 로그인 구현되면 받아오는걸로 수정하기
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-ACCESS-TOKEN': accessToken
    };

    // EmergencyContactReq 객체를 JSON 문자열로 변환
    String contactsJson = jsonEncode(contacts.toJson());
    print(contactsJson);

    String _url = '${baseUrl}/users/emergency';
    final response =
        await http.patch(Uri.parse(_url), headers: headers, body: contactsJson);

    var statusCode = response.statusCode;
    print(statusCode);

    var responseBody = utf8.decode(response.bodyBytes);
    Map responseMap = jsonDecode(responseBody);
    var result = BaseResponse.fromJson(responseMap);
  }
}
