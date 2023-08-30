
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/screen/camera_result.dart';
import 'package:flutter_application/screen/emergency_contact.dart';
import 'package:flutter_application/screen/medication_info.dart';
import 'package:flutter_application/screen/name_result.dart';
import 'package:flutter_application/widget/choosePic.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_application/screen/loginPage.dart';
import 'package:flutter_application/screen/mainScreenAfterLogin.dart';
import 'package:flutter_application/screen/mainScreenBeforeLogin.dart';
import 'package:flutter_application/screen/registerMedInfoAuto.dart';
import 'package:flutter_application/screen/registerMedInfoManual.dart';
import 'package:flutter_application/screen/myPage.dart';
import 'package:flutter_application/widget/medTimeButton.dart';
import 'package:flutter_application/widget/timePickerWidget.dart';
import 'package:flutter_application/widget/imagePickerWidgetInMed.dart';
import 'dart:ui';


void main() {
  runApp(// 하나의 위젯(시작점)을 파라미터로 전달 받는 runApp 함수
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // datePickerWidget 언어 한글로 변경
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KO'),
      ],
      // debug 로고 제거
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: 'Inter',
          ),
        ),
      ),

      home: MyHomePage_after(),

    );
  }
}
