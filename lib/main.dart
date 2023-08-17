
import 'package:flutter/material.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/screen/home_screen.dart';
import 'package:flutter_application/widget/find_med_widget.dart';
import 'package:flutter_application/widget/todays_med_widget.dart';
import 'package:flutter_application/widget/before_login_widget.dart';
import 'package:flutter_application/widget/register_med_info.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/screen/camera_result.dart';
import 'package:flutter_application/screen/emergency_contact.dart';
import 'package:flutter_application/screen/medication_info.dart';
import 'package:flutter_application/screen/medication_info_delete.dart';
import 'package:flutter_application/screen/search.dart';
import 'screen/name_result.dart';

void main() {
  runApp(MyApp()); // 하나의 위젯(시작점)을 파라미터로 전달 받는 runApp 함수
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'ChalKak Medicine';
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: 'Inter',
          ),
        ),
      ),
      title: _title,
      home: MedicationInfo(), 
    );

  }
}
