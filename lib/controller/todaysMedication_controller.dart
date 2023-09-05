import 'dart:io';

import 'package:flutter_application/model/base_response.dart';
import 'package:flutter_application/model/medication.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/medication_info_list_res.dart';

class TodaysMedicationController {
  final String baseUrl = dotenv.get("BASE_URL");
  //Todo: 로그인 구현되면 받아오는걸로 수정하기
  final String accessToken = dotenv.get("ACCESS_TOKEN");

  Future<List<Medication>> fetchMedicationInfo(int page) async {
    //Todo: 로그인 구현되면 받아오는걸로 수정하기
    Map<String, String> headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'X-ACCESS-TOKEN': accessToken};

    String url = '$baseUrl/medications/today';
    final response = await http.get(Uri.parse(url), headers: headers);

    var statusCode = response.statusCode;
    print(statusCode);
    if (statusCode == HttpStatus.ok) {
      var responseBody = utf8.decode(response.bodyBytes);
      Map responseMap = jsonDecode(responseBody);
      var BrmedicationInfo = BaseResponse.fromJson(responseMap);
      var medList= BrmedicationInfo.result.map((item) => Medication.fromJson(item)).toList();
      return medList;
    } else {
      throw Exception("복약 정보 리스트를 불러오는데 실패했습니다.");
    }
  }
}

