// 복약 정보 등록하기 : 수동
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/widget/datePickerWidget.dart';
import 'package:flutter_application/widget/medCountWidget.dart';
import 'package:flutter_application/widget/medCycleWidget.dart';

class RegisterMedPageManual extends StatefulWidget {
  const RegisterMedPageManual({super.key, required this.title});

  final String title;
  @override
  State<RegisterMedPageManual> createState() => _RegisterMedPageManualState();
}

class _RegisterMedPageManualState extends State<RegisterMedPageManual> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RegisterMedManual(),
          ]
        ),
      )
    );
  }
}

class RegisterMedManual extends StatefulWidget {
  _RegisterMedManualState createState() => _RegisterMedManualState();
}

class _RegisterMedManualState extends State<RegisterMedManual> {
  bool _isChecked = false; // 복약 알림 - switch
  bool _isChoosedTimeB = false; // 복약 시간 - 아침
  bool _isChoosedTimeL = false; // 복약 시간 - 점심
  bool _isChoosedTimeD = false; // 복약 시간 - 저녁
  bool _isChoosedBe = false; // 복약 시간 - 식전
  bool _isChoosedAf = false; // 복약 시간 - 식전

  @override
  void initState() {
    // 초기화
    super.initState();
    _isChecked = false;
    _isChoosedTimeB = false;
    _isChoosedTimeL = false;
    _isChoosedTimeD = false;
    _isChoosedBe = false;
    _isChoosedAf = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Row(
              children: [
                SizedBox(width: 7),
                CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    CupertinoIcons.chevron_left,
                    size: 20, color: bright_green
                  )
                ),
                SizedBox(width: 130),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '복약 정보 등록하기',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )),
          Container(
            padding: EdgeInsets.fromLTRB(155, 36, 155, 0),
            child: Stack(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, 
                    color: main_color_green
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(26, 26, 26, 26),
                  child: Icon(
                    CupertinoIcons.photo_on_rectangle,
                    size: 28,
                    color: dark_green,
                  )
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(80, 18, 0, 0),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 168,
                      height: 40,
                      decoration: BoxDecoration(
                        color: bright_gray,
                        borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text('약 이름',
                        style: TextStyle(
                          fontSize: 15,
                        )
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 12),
                // 약 개수 선택 위젯
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                DatePickerWidget(),
                SizedBox(width: 2),
                Text('~',
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
          SizedBox(height: 20),
          // 복약 시간
          Container(
            padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '복약 시간',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )
            )
          ),
          SizedBox(height: 7),
          Row(
            children: [
              SizedBox(
                width: 45,
              ),
              SizedBox(
                width: 57,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isChoosedTimeB = !_isChoosedTimeB;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        _isChoosedTimeB ? bright_green : bright_gray)),
                  child: Text('아침',
                    style: TextStyle(
                      color: _isChoosedTimeB ? white : dark_gray,
                      fontWeight: FontWeight.w300
                    )
                  )
                ),
              ),
              SizedBox(width: 11),
              SizedBox(
                width: 57,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isChoosedTimeL = !_isChoosedTimeL;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        _isChoosedTimeL ? bright_green : bright_gray),
                  ),
                  child: Text('점심',
                    style: TextStyle(
                      color: _isChoosedTimeL ? white : dark_gray,
                      fontWeight: FontWeight.w300
                    )
                  )
                ),
              ),
              SizedBox(width: 11),
              SizedBox(
                width: 57,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isChoosedTimeD = !_isChoosedTimeD;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        _isChoosedTimeD ? bright_green : bright_gray),
                  ),
                  child: Text('저녁',
                    style: TextStyle(
                      color: _isChoosedTimeD ? white : dark_gray,
                      fontWeight: FontWeight.w300
                    )
                  )
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
          Row(
            children: [
              SizedBox(width: 45),
              SizedBox(
                width: 57,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isChoosedBe = !_isChoosedBe;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        _isChoosedBe ? bright_green : bright_gray),
                  ),
                  child: Text('식전',
                    style: TextStyle(
                      color: _isChoosedBe ? white : dark_gray,
                      fontWeight: FontWeight.w300
                    )
                  )
                ),
              ),
              SizedBox(width: 11),
              SizedBox(
                width: 57,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isChoosedAf = !_isChoosedAf;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        _isChoosedAf ? bright_green : bright_gray),
                  ),
                  child: Text('식후',
                    style: TextStyle(
                      color: _isChoosedAf ? white : dark_gray,
                      fontWeight: FontWeight.w300
                    )
                  )
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // 복약 주기
          Container(
            padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text('복약 주기',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )
            )
          ),
          SizedBox(
            height: 10
          ),
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
          CupertinoButton(
            onPressed: () {},
            minSize: 0,
            padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
            child: Stack(
              children: [
                Container(
                  child: Container(
                    width: 319,
                    height: 40,
                    decoration: BoxDecoration(
                      color: bright_gray,
                      borderRadius: BorderRadius.circular(12)
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(130, 9, 0, 9),
                  child: Text('13 : 00 PM',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: dark_gray
                    )
                  )
                ),
              ]
            )
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '설명',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )
            )
          ),
          SizedBox(
            height: 10
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Container(
              width: 324,
              height: 219,
              decoration: BoxDecoration(
                color: bright_gray,
                borderRadius: BorderRadius.circular(12)
              ),
            )
          ),
          // 여유 공간
          SizedBox(
            height: 30
          )
        ],
      ),
    );
  }
}
