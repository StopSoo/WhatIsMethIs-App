import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/controller/medicine_controller.dart';

import '../components/component.dart';
import '../model/medicine.dart';
import 'registerMedInfoAuto.dart';

class NameResult extends StatefulWidget {
  final String itemSeq;
  const NameResult({Key? key, required this.itemSeq}) : super(key: key);

  @override
  _NameResultState createState() => _NameResultState();
}

class _NameResultState extends State<NameResult> {
  final MedicineController _medicineController = MedicineController();
  late Medicine _medicine = Medicine(null, null, null, null, null, null, null,
      null, null, null, null, null, null, null);

  @override
  void initState() {
    super.initState();
    _loadMedicineInfo();
  }

  Future<void> _loadMedicineInfo() async {
    Medicine medicine =
        await _medicineController.fetchMedicineInfo(widget.itemSeq);
    setState(() {
      _medicine = medicine;
    });
  }

  //TODO: 일정 시간 로딩 후 식별 결과 없음 표시
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return safeAreaPage(
      Colors.white,
      Colors.white,
      _medicine.itemSeq == null
          ? CupertinoActivityIndicator()
          : SingleChildScrollView(
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
                        //복약정보 등록 확인(?) 팝업
                        _showAlert(
                            "'${_medicine.itemName}'을(를) 복약 정보에 등록하시겠습니까?",
                            "'${_medicine.itemName}'을(를) 복약 정보에 등록하기 위해 복약 정보 등록페이지로 이동합니다.",
                            _medicine.itemName!,
                            _medicine.itemSeq!,
                            _medicine.itemImage);
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
                    child: roundFitWidthImage(width, _medicine.itemImage),
                  ),
                  pillDetailBox("제품명", _medicine.itemName),
                  pillDetailBox("업체명", _medicine.entpName),
                  pillDetailBox("효능", _medicine.efcyQesitm),
                  pillDetailBox("사용법", _medicine.useMethodQesitm),
                  pillDetailBox("주의사항경고", _medicine.atpnWarnQesitm),
                  pillDetailBox("주의사항", _medicine.atpnQesitm),
                  pillDetailBox("상호작용", _medicine.intrcQesitm),
                  pillDetailBox("부작용", _medicine.seQesitm),
                  pillDetailBox("보관법", _medicine.depositMethodQesitm),
                ],
              ),
            ),
    );
  }

  void _showAlert(String title, String message, String medicineName,
      String medicineId, String? medicineImage) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                  child: Text("아니오"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("예"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => RegisterMedPageAuto(
                                  medicineName: medicineName,
                                  medicineId: medicineId,
                                  medicineImage: medicineImage,
                                )));
                  })
            ],
          );
        });
  }
}
