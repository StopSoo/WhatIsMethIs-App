import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/screen/registerMedInfoAuto.dart';

import '../components/component.dart';
import '../components/textstyle.dart';
import '../controller/medicine_controller.dart';
import '../model/medicine.dart';

class CameraResult extends StatefulWidget {
  String itemSeq;
  CameraResult({Key? key, required this.itemSeq}) : super(key: key);

  @override
  _CameraResultState createState() => _CameraResultState();
}

class _CameraResultState extends State<CameraResult> {
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

//TODO: 일정 시간 로딩 후 식별 결과 없음 표시, 중복 코드 리팩토링
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
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          //복약정보 등록 확인(?) 팝업
                          _showAlert(
                              "'${_medicine.itemName}'을(를) 복약 정보에 등록하시겠습니까?",
                              "'${_medicine.itemName}'을(를) 복약 정보에 등록하기 위해 복약 정보 등록페이지로 이동합니다.",
                              _medicine.itemName!,
                              _medicine.itemSeq!
                              );
                        },
                        child: const Icon(
                          CupertinoIcons.rectangle_stack_badge_plus,
                          color: more_green,
                          size: 28,
                        ),
                      )),
                  CupertinoButton(
                    minSize: 0,
                    padding: const EdgeInsets.all(16.0),
                    onPressed: () {
                      //Todo: 카메라 다시 찍기
                    },
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        roundFitWidthBlurImage(
                            width, 'assets/images/test_cat.jpg'),
                        Center(
                          child: Text(
                            "사진을 눌러 다시 찍기",
                            style: customTextStyle(
                                16, Colors.white, FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 1,
                    color: gray,
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

  ClipRRect roundFitWidthBlurImage(double width, String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Stack(
        children: [
          //사용자가 찍은 사진 - 추후에 Image.asset -> 다른걸로 변경
          Image.asset(
            image,
            width: width,
            height: width * (0.5),
            fit: BoxFit.fitWidth,
          ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                width: width,
                height: 180,
                color: Colors.transparent,
              )),
        ],
      ),
    );
  }

  void _showAlert(String title, String message, String medicineName, String medicineId) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                  child: const Text("아니오"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: const Text("예"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                RegisterMedPageAuto(medicineName: medicineName, medicineId: medicineId,)));
                  })
            ],
          );
        });
  }
}
