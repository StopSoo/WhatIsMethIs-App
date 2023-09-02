// 복약 정보 등록하기 : 수동
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../components/component.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/widget/timePickerWidget.dart';
import 'package:flutter_application/widget/datePickerWidget.dart';
import 'package:flutter_application/widget/medCountWidget.dart';
import 'package:flutter_application/widget/medCycleWidget.dart';
import 'package:flutter_application/widget/medTimeBeAfButton.dart';
import 'package:flutter_application/widget/medTimeButton.dart';
import 'package:flutter_application/widget/imagePickerWidgetInMed.dart';

class RegisterMedPageManual extends StatefulWidget {
  const RegisterMedPageManual({super.key});

  @override
  State<RegisterMedPageManual> createState() => _RegisterMedPageManualState();
}

class _RegisterMedPageManualState extends State<RegisterMedPageManual> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(children: <Widget>[
              RegisterMedManual(),
            ]),
          )),
    );
  }
}

class RegisterMedManual extends StatefulWidget {
  const RegisterMedManual({super.key});

  @override
  _RegisterMedManualState createState() => _RegisterMedManualState();
}

class _RegisterMedManualState extends State<RegisterMedManual> {
  bool _isChecked = false; // 복약 알림 - switch

  @override
  void initState() {
    // 초기화
    super.initState();
    _isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    return safeAreaPage(
      Colors.white,
      Colors.white,
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            defaultHeader('복약 정보 등록하기', context, const SizedBox(width: 30)),
            const ImagePickerWidget(),
            Container(
                padding: const EdgeInsets.fromLTRB(80, 18, 0, 0),
                child: Row(
                  children: [
                    Container(
                        child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 6, 0, 0),
                      width: 168,
                      height: 40,
                      decoration: BoxDecoration(color: bright_gray, borderRadius: BorderRadius.circular(12)),
                      child: const TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            hintText: '약 이름',
                            hintStyle: TextStyle(color: dark_gray, fontSize: 16),
                            border: InputBorder.none, // 텍스트 박스 아래 줄 제거
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)),
                      ),
                    )
                  ),
                  
                  SizedBox(width: 12),
                  // 약 개수 선택 위젯
                  MedCountPickerWidget(selectedCount: 0,)
                ],
              )
            ),
            // 복용 기간
            Container(
                padding: EdgeInsets.fromLTRB(45, 27, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text('복용 기간',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ))),
            Container(
              alignment: Alignment.center,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                DatePickerWidget(
                  selectedDate: DateTime.now(),
                ),
                SizedBox(width: 2),
                Text('~',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                SizedBox(width: 2),
                DatePickerWidget(
                  selectedDate: DateTime.now(),
                ),
              ]),
            ),
            const SizedBox(height: 15),
            // 복약 시간
            Container(
                padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: const Text('복약 시간',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ))),
            const SizedBox(height: 7),
            Container(
              alignment: Alignment.center,
              child: const MedTimeControlWidget(),
            ),
            const SizedBox(height: 7),
            Container(
              alignment: Alignment.center,
              child: const MedTimeBeAfControlWidget(),
            ),
            const SizedBox(
              height: 15,
            ),
            // 복약 주기
            Container(
                padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: const Text('복약 주기',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ))),
            const SizedBox(height: 10),
            const MedCyclePickerWidget(selectedCycle: 0,),
            const SizedBox(
              height: 10,
            ),
            // 복약 알림
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(45, 0, 10, 0),
                    alignment: Alignment.centerLeft,
                    child: const Text('복약 알림',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ))),
                CupertinoSwitch(
                  value: _isChecked,
                  activeColor: CupertinoColors.activeGreen,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 8),
            const DatePickerExample(time: DateTime.now(),),
            const SizedBox(
              height: 13,
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: const Text('설명',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ))),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                  width: 324,
                  height: 219,
                  decoration: BoxDecoration(color: bright_gray, borderRadius: BorderRadius.circular(12)),
                  child: const TextField(
                    scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    keyboardType: TextInputType.multiline,
                    maxLines: null, // 자동 줄바꿈
                    decoration: InputDecoration(
                        hintText: '약에 대한 설명을 입력하세요.',
                        border: InputBorder.none, // 텍스트 박스 아래 줄 제거
                        labelStyle: TextStyle(color: dark_gray),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                )),
            // 여유 공간
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
