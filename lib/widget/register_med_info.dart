// class RegisterMedPage
// 복약 정보 등록하기
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';

class RegisterMed extends StatefulWidget {
  _RegisterMedState createState() => _RegisterMedState();
}

class _RegisterMedState extends State<RegisterMed> {
  bool _isChecked = false; // switch
  bool _isChoosed = false; // 복약 시간

  @override
  void initState() {
    super.initState();
    _isChecked = false;
    _isChoosed = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              SizedBox(width: 7),
              CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: EdgeInsets.all(0),
                  child: Icon(CupertinoIcons.chevron_left,
                      size: 20, color: bright_green)),
              SizedBox(width: 130),
              Text(
                '복약 정보 등록하기',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(155, 36, 155, 0),
            child: Stack(
              children: [
                Image.asset('images/icon_greenCircle.png', width: 80),
                Container(
                    margin: EdgeInsets.fromLTRB(26, 26, 26, 26),
                    child: Icon(
                      CupertinoIcons.photo_on_rectangle,
                      size: 28,
                      color: dark_green,
                    ))
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(80, 18, 0, 0),
              child: Row(
                children: [
                  Text('타이레놀8시간이알서방정',
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  SizedBox(width: 12),
                  CupertinoButton(
                      onPressed: () {},
                      minSize: 0,
                      padding: EdgeInsets.fromLTRB(12, 6, 0, 0),
                      child: Stack(children: [
                        Image.asset('images/icon_grayBox.png', width: 60),
                        Padding(
                            padding: EdgeInsets.fromLTRB(15, 11, 15, 9),
                            child: Text('1정',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: dark_gray))),
                      ])),
                ],
              )),
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
            padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
            alignment: Alignment.center,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Stack(children: [
                Image.asset(
                  'images/icon_date_bar.png',
                  width: 150,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(14, 9, 15, 9),
                  child: Text('2023년 08월 03일',
                      style: TextStyle(color: dark_gray, fontSize: 15)),
                )
              ]),
              SizedBox(width: 7),
              Image.asset('images/icon_wave.png', height: 14),
              SizedBox(width: 7),
              Stack(children: [
                Image.asset(
                  'images/icon_date_bar.png',
                  width: 150,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(14, 9, 15, 9),
                  child: Text('2023년 08월 03일',
                      style: TextStyle(color: dark_gray, fontSize: 15)),
                )
              ]),
            ]),
          ),
          SizedBox(height: 20),
          // 복약 시간
          Container(
              padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text('복약 시간',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ))),
          Row(
            children: [
              CupertinoButton(
                  onPressed: () {
                  },
                  minSize: 0,
                  padding: EdgeInsets.fromLTRB(45, 7, 0, 0),
                  child: Stack(children: [
                    Image.asset('images/icon_grayBox.png', width: 57),
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 9, 15, 9),
                        child: Text('아침',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: dark_gray))),
                  ])),
              CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: EdgeInsets.fromLTRB(11, 7, 0, 0),
                  child: Stack(children: [
                    Image.asset('images/icon_grayBox.png', width: 57),
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 9, 15, 9),
                        child: Text('점심',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: dark_gray))),
                  ])),
              CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: EdgeInsets.fromLTRB(11, 7, 0, 0),
                  child: Stack(children: [
                    Image.asset('images/icon_grayBox.png', width: 57),
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 9, 15, 9),
                        child: Text('저녁',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: dark_gray))),
                  ])),
            ],
          ),
          Row(
            children: [
              CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: EdgeInsets.fromLTRB(45, 7, 0, 0),
                  child: Stack(children: [
                    Image.asset('images/icon_grayBox.png', width: 57),
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 9, 15, 9),
                        child: Text('식전',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: dark_gray))),
                  ])),
              CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: EdgeInsets.fromLTRB(11, 7, 0, 0),
                  child: Stack(children: [
                    Image.asset('images/icon_grayBox.png', width: 57),
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 9, 15, 9),
                        child: Text('식후',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: dark_gray))),
                  ])),
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
                  ))),
          CupertinoButton(
              onPressed: () {},
              minSize: 0,
              padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
              child: Stack(children: [
                Image.asset('images/icon_longGrayBox.png', height: 40),
                Padding(
                    padding: EdgeInsets.fromLTRB(150, 9, 0, 9),
                    child: Text('1 달',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: dark_gray))),
              ])),
          SizedBox(
            height: 25,
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
          CupertinoButton(
              onPressed: () {},
              minSize: 0,
              padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
              child: Stack(children: [
                Image.asset('images/icon_longGrayBox.png', height: 40),
                Padding(
                    padding: EdgeInsets.fromLTRB(130, 9, 0, 9),
                    child: Text('13 : 00 PM',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: dark_gray))),
              ])),
          SizedBox(
            height: 16,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text('설명',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ))),
          Container(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
              child: Image.asset('images/icon_bigGrayBox.png')),
        ],
      ),
    );
  }

}
