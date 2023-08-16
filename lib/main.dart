import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'constants/colors.dart';
import 'package:flutter_application/screen/mainScreenAfterLogin.dart';
import 'package:flutter_application/screen/mainScreenBeforeLogin.dart';
import 'package:flutter_application/screen/registerMedInfoAuto.dart';
import 'package:flutter_application/widget/datePickerWidget.dart';

void main() {
  runApp(MyApp()); // 하나의 위젯(시작점)을 파라미터로 전달 받는 runApp 함수
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

// MyApp의 상태를 관리
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // debug 표시 없애기
      title: 'Chalkak Medicine',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: white,
        hintColor: black,
      ),
      home: const RegisterMedPageAuto(title: 'Flutter Demo Home Page'),
    );
  }
}
