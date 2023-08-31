// 복약 정보 등록하기 : 자동
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../components/component.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/widget/datePickerWidget.dart';
import 'package:flutter_application/widget/timePickerWidget.dart';
import 'package:flutter_application/widget/medCountWidget.dart';
import 'package:flutter_application/widget/medCycleWidget.dart';
import 'package:flutter_application/widget/medTimeBeAfButton.dart';
import 'package:flutter_application/widget/medTimeButton.dart';
import 'package:flutter_application/widget/imagePickerWidgetInMed.dart';

class RegisterMedPageAuto extends StatefulWidget {
  const RegisterMedPageAuto({super.key});

  @override
  State<RegisterMedPageAuto> createState() => _RegisterMedPageAutoState();
}

class _RegisterMedPageAutoState extends State<RegisterMedPageAuto> {

  @override
  Widget build(BuildContext context) {
    return safeAreaPage(
    Colors.white,
    Colors.white,
      GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                RegisterMed(),
              ]
            ),
          )
        ),
      ),
    );
  }
}

class RegisterMed extends StatefulWidget {
  _RegisterMedState createState() => _RegisterMedState();
}

class _RegisterMedState extends State<RegisterMed> {
  bool _isChecked = false; // 복약 알림 - switch

  @override
  void initState() {
    // 초기화
    super.initState();
    _isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: white),
      child: Column(
        children: <Widget>[
          defaultHeader('복약 정보 등록하기', context, SizedBox(width: 30)),
          // 갤러리에서 사진 선택하는 위젯
          ImagePickerWidget(),  
          Container(
            padding: EdgeInsets.fromLTRB(80, 10, 0, 0),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text('타이레놀8시간이알서방정',
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ),
                SizedBox(width: 12),
                MedCountPickerWidget()
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
              )
            )
          ),
          Container(
            alignment: Alignment.center,
            child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  DatePickerWidget(),
                  SizedBox(width: 2),
                  Text(
                    '~',
                    style: TextStyle(
                      fontSize: 12, 
                      fontWeight: FontWeight.w700
                    )
                  ),
                  SizedBox(width: 2),
                  DatePickerWidget(),
                ]
              ),
          ),
          SizedBox(height: 15),
          // 복약 시간
          Container(
              padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text('복약 시간',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ))),
          SizedBox(height: 7),
          Container(
            alignment: Alignment.center,
            child: MedTimeControlWidget(),
          ),
          SizedBox(height: 7),
          Container(
            alignment: Alignment.center,
            child: MedTimeBeAfControlWidget(),
          ),
          SizedBox(
            height: 15,
          ),
          // 복약 주기
          Container(
              padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text('복약 주기',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ))),
          SizedBox(height: 10),
          MedCyclePickerWidget(),
          SizedBox(
            height: 10,
          ),
          // 복약 알림
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(45, 0, 10, 0),
                alignment: Alignment.centerLeft,
                child: Text('복약 알림',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )
                )
              ),
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
          SizedBox(height: 8),
          DatePickerExample(),
          SizedBox(
            height: 13,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text('설명',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ))),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
              width: 324,
              height: 219,
              decoration: BoxDecoration(
                color: bright_gray,
                borderRadius: BorderRadius.circular(12)
              ),
              child: TextField(
                scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                keyboardType: TextInputType.multiline,
                maxLines: null, // 자동 줄바꿈
                decoration: const InputDecoration(
                  hintText: '약에 대한 설명을 입력하세요.',
                  border: InputBorder.none, // 텍스트 박스 아래 줄 제거
                  labelStyle: TextStyle(color: dark_gray),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  )
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}