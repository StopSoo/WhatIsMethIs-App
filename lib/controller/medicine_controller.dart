import 'package:flutter_application/model/base_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/medicine.dart';
import '../model/medicine_info_list_res.dart';

class MedicineController {
  final String baseUrl = dotenv.get("BASE_URL");

  Future<Medicine> fetchMedicineInfo(String itemSeq) async {
    String url = '$baseUrl/medicines?itemSeq=$itemSeq';
    final response = await http.get(Uri.parse(url));

    var responseBody = utf8.decode(response.bodyBytes);
    Map responseMap = jsonDecode(responseBody);

    var Brmedicine = BaseResponse.fromJson(responseMap);

    var medicineInfoListRes = MedicineInfoListRes.fromJson(Brmedicine.result);

    return medicineInfoListRes.medicines[0];
  }

  Future<List<Medicine>> fetchAllMedicineListInfo(int pageNo) async {
    String url = '$baseUrl/medicines?pageNo=$pageNo';
    final response = await http.get(Uri.parse(url));

    var responseBody = utf8.decode(response.bodyBytes);
    Map responseMap = jsonDecode(responseBody);

    var Brmedicine = BaseResponse.fromJson(responseMap);

    var medicineInfoListRes = MedicineInfoListRes.fromJson(Brmedicine.result);

    return medicineInfoListRes.medicines;
  }

  Future<List<Medicine>> fetchMedicineListInfoWithName(String itemName) async {
    String url = '$baseUrl/medicines?pageNo=1&itemName=$itemName';
    final response = await http.get(Uri.parse(url));

    var responseBody = utf8.decode(response.bodyBytes);
    Map responseMap = jsonDecode(responseBody);

    var Brmedicine = BaseResponse.fromJson(responseMap);

    var medicineInfoListRes = MedicineInfoListRes.fromJson(Brmedicine.result);

    return medicineInfoListRes.medicines;
  }
}

Future<MedicineInfoListRes?> fetchTodayMedicine() async {
  final String baseUrl = dotenv.get("BASE_URL");

  final response = await http.get(Uri.parse("$baseUrl/medications/today"));

  if (response.statusCode == 200) {
    BaseResponse res = BaseResponse.fromJson(json.decode(response.body));

    MedicineInfoListRes medicineInfoListRes = MedicineInfoListRes.fromJson(res.result);

    print(medicineInfoListRes.toJson().toString());

    return medicineInfoListRes;
  } else {
    print(response.body);

    return null;
  }
}
