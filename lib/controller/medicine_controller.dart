import 'package:flutter_application/model/base_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/medicine.dart';
import '../model/medicine_info_list_res.dart';

class MedicineController{
  final String baseUrl = dotenv.get("BASE_URL");

  Future<Medicine> fetchMedicineInfo(String itemSeq) async {
    
    String _url = '${baseUrl}/medicines?itemSeq=${itemSeq}';
    final response = await http.get(Uri.parse(_url));

    var responseBody = utf8.decode(response.bodyBytes);
    Map responseMap = jsonDecode(responseBody);

    var Brmedicine = BaseResponse.fromJson(responseMap);

    var medicineInfoListRes = MedicineInfoListRes.fromJson(Brmedicine.result);
    
    return medicineInfoListRes.medicines[0];
  }

}
