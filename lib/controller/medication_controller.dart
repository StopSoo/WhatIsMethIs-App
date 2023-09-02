import 'dart:io';

import 'package:flutter_application/model/base_response.dart';
import 'package:flutter_application/model/medication.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/medication_info_list_res.dart';

class MedicationController {
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
    print(statusCode);
    if(statusCode == HttpStatus.ok){
      var responseBody = utf8.decode(response.bodyBytes);
    Map responseMap = jsonDecode(responseBody);
    var BrmedicationInfo = BaseResponse.fromJson(responseMap);
    var medList = MedicationInfoListRes.fromJson(BrmedicationInfo.result);

    return medList.medicationShortInfos;

    } else{
      throw Exception("복약 정보 리스트를 불러오는데 실패했습니다.");
    }
    
  }

  Future<void> deleteMedicationInfo(List<int> medicationIds) async {
    //Todo: 로그인 구현되면 받아오는걸로 수정하기
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-ACCESS-TOKEN': accessToken
    };

    final queryParams = {
      'medicationIdList': medicationIds.join(','),
    };
    print(queryParams);
    String _url = '${baseUrl}/medications?';

    final response = await http.delete(
      Uri.parse(_url).replace(queryParameters: queryParams),
      headers: headers,
    );
    
    var responseBody = utf8.decode(response.bodyBytes);
    print(responseBody);
  }

  Future<Medication> fetchMedicationInfoIndex(int _index) async {
    //Todo: 로그인 구현되면 받아오는걸로 수정하기
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-ACCESS-TOKEN': accessToken
    };

    String _url = '${baseUrl}/medications/${_index}';
    final response = await http.get(Uri.parse(_url), headers: headers);

    var statusCode = response.statusCode;
    print(statusCode);
    if(statusCode == HttpStatus.ok){
      var responseBody = utf8.decode(response.bodyBytes);
    Map responseMap = jsonDecode(responseBody);
    var BrmedicationInfo = BaseResponse.fromJson(responseMap);
    var medication = Medication.fromJson(BrmedicationInfo.result);
    return medication;

    } else{
      throw Exception("복약 정보를 불러오는데 실패했습니다.");
    }
    
  }

  Future<void> editMedicationInfoIndex(int _index, Medication medication) async {
    //Todo: 로그인 구현되면 받아오는걸로 수정하기
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-ACCESS-TOKEN': accessToken
    };

    // Medication 객체를 JSON 문자열로 변환
  String medicationJson = jsonEncode(medication.toJson());
  print(medicationJson);

    String _url = '${baseUrl}/medications/${_index}';
    final response = await http.patch(Uri.parse(_url), headers: headers, body: medicationJson);

    var statusCode = response.statusCode;
    print(statusCode);

    var responseBody = utf8.decode(response.bodyBytes);
    Map responseMap = jsonDecode(responseBody);
    var result = BaseResponse.fromJson(responseMap);

  }




}
