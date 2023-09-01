import 'package:flutter_application/model/base_response.dart';
import 'package:flutter_application/model/medication.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/medication_info_list_res.dart';


class MedicationController{
  final String baseUrl = dotenv.get("BASE_URL");
   //Todo: 로그인 구현되면 받아오는걸로 수정하기
  final String accessToken = dotenv.get("ACCESS_TOKEN");

  Future<List<Medication>> fetchMedicationInfo(int _page) async {
    //Todo: 로그인 구현되면 받아오는걸로 수정하기
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-ACCESS-TOKEN': accessToken
    };
    
    String _url = '${baseUrl}/medications/all/${_page}';
    final response = await http.get(Uri.parse(_url), headers: headers);

    var statusCode = response.statusCode;
    var responseBody = utf8.decode(response.bodyBytes);
    Map responseMap = jsonDecode(responseBody);
    var BrmedicationInfo = BaseResponse.fromJson(responseMap);
    var medList =
        MedicationInfoListRes.fromJson(BrmedicationInfo.result);

    return medList.medicationShortInfos;
  }
  
}