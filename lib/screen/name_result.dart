import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/provider/medicine_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application/dto/base_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../components/component.dart';
import '../model/medicine.dart';

class NameResult extends StatefulWidget {
  const NameResult({Key? key}) : super(key: key);

  @override
  _NameResultState createState() => _NameResultState();
}

class _NameResultState extends State<NameResult> {
  late MedicineProvider _medicineProvider;
  /*
   e약은요 API 기준 명명
  */
  String itemSeq = "1";
  String itemName = "닥터베아제정";
  String entpName = "(주)대웅제약";
  String efcyQesitm = ''' 이 약은 소화불량, 식욕감퇴(식욕부진), 과식, 체함, 소화촉진, 소화불량으로 인한 위부팽만감에 사용합니다.''';
  String useMethodQesitm = "성인 1회 1정을 1일 3회 식후에 복용합니다.";
  String atpnWarnQesitm = "";
  String atpnQesitm = '''만 7세 이하의 소아는 이 약을 복용하지 마십시오.
이 약을 복용하기 전에 알레르기 체질인 사람, 임부 또는 임신하고 있을 가능성이 있는 여성, 이 약 또는 황색4호에 과민증 환자는 의사 또는 약사와 상담하십시오.
정해진 용법과 용량을 잘 지키십시오.
2주 정도 복용하여도 증상의 개선이 없을 경우 즉각 복용을 중지하고 의사 또는 약사와 상담하십시오.''';
  String intrcQesitm = "";
  String seQesitm = "";
  String depositMethodQesitm = '''습기와 빛을 피해 실온에서 보관하십시오.
어린이의 손이 닿지 않는 곳에 보관하십시오.''';
  String openDe = "";
  String updateDe = "";
  String itemImage = "";
  String bizrno = "";

  late Medicine medicine = Medicine(entpName, itemName, itemSeq, efcyQesitm, useMethodQesitm, atpnWarnQesitm, atpnQesitm, intrcQesitm, seQesitm,
      depositMethodQesitm, openDe, updateDe, itemImage, bizrno);

  @override
  Widget build(BuildContext context) {
    //헬프 미 플리즈...ㅜ
    _medicineProvider = Provider.of<MedicineProvider>(context, listen: false);
    _medicineProvider.setMedicine(medicine);
    print("medicine itemName: ${medicine.itemName}");
    print("medicine entpName: ${medicine.entpName}");

    fetchMedicineInfo();
    double width = MediaQuery.of(context).size.width;
    return safeAreaPage(
      Colors.white,
      Colors.white,
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultHeader(
              "식별 결과 보기",
              context,
              CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.all(0),
                onPressed: () {
                  //Navigate to (수동)복약 정보 등록
                },
                child: const Icon(
                  CupertinoIcons.rectangle_stack_badge_plus,
                  color: more_green,
                  size: 28,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: roundFitWidthImage(width, 'assets/images/test_cat.jpg'),
            ),
            pillDetailBox("제품명", itemName),
            pillDetailBox("업체명", entpName),
            pillDetailBox("효능", efcyQesitm),
            pillDetailBox("사용법", useMethodQesitm),
            pillDetailBox("주의사항경고", atpnWarnQesitm),
            pillDetailBox("주의사항", atpnQesitm),
            pillDetailBox("상호작용", intrcQesitm),
            pillDetailBox("부작용", seQesitm),
            pillDetailBox("보관법", depositMethodQesitm),
          ],
        ),
      ),
    );
  }

  void fetchMedicineInfo() async {
    String baseUrl = dotenv.get("BASE_URL");
    String seq = "202001927";

    late String _url = '${baseUrl}/medicines?itemSeq=${seq}';
    final response = await http.get(Uri.parse(_url));

    var responseBody = utf8.decode(response.bodyBytes);
    Map responseMap = jsonDecode(responseBody);

    var Brmedicine = BaseResponse.fromJSON(responseMap);
  }
}
