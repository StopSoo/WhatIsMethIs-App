import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/screen/mainScreenAfterLogin.dart';
import 'package:flutter_application/screen/mainScreenBeforeLogin.dart';
import 'package:flutter_application/screen/registerMedInfoAuto.dart';
import 'package:flutter_application/screen/registerMedInfoManual.dart';
import 'package:flutter_application/screen/myPage.dart';
import 'package:flutter_application/widget/medTimeButton.dart';
import 'package:flutter_application/widget/timePickerWidget.dart';
import 'dart:ui';
import 'package:flutter_application/screen/camera_result.dart';
import 'package:flutter_application/screen/emergency_contact.dart';
import 'package:flutter_application/screen/medication_info.dart';
import 'package:flutter_application/screen/medication_info_delete.dart';
import 'package:flutter_application/screen/search.dart';
import 'screen/name_result.dart';

void main() {
  runApp(// 하나의 위젯(시작점)을 파라미터로 전달 받는 runApp 함수
      MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'ChalKak Medicine';
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: 'Inter',
          ),
        ),
      ),
      home: const RegisterMedPageAuto(title: ''),
    );
  }
}
