import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'constants/colors.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/screen/home_screen.dart';
import 'package:flutter_application/widget/find_med_widget.dart';
import 'package:flutter_application/widget/todays_med_widget.dart';
import 'package:flutter_application/widget/before_login_widget.dart';
import 'package:flutter_application/widget/register_med_info.dart';
import 'package:flutter_application/widget/register_med_bar.dart';


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
      home: const RegisterMedPage(title: 'Flutter Demo Home Page'),
    );
  }
}

// 1. 메인 화면 - 로그인 후
// 가로 스크롤 버튼 만들어야 함
class MyHomePage_after extends StatefulWidget {
  const MyHomePage_after({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage_after> createState() => _MyHomePage_afterState();
}

class _MyHomePage_afterState extends State<MyHomePage_after> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: <Widget>[
        HomeScreen(),
        TodaysMed(),
        SizedBox(height: 56),
        FindMed(),
      ]),
    ));
  }
}

// 2. 메인 화면 - 로그인 전
class MyHomePage_before extends StatefulWidget {
  const MyHomePage_before({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage_before> createState() => _MyHomePage_beforeState();
}

class _MyHomePage_beforeState extends State<MyHomePage_before> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            HomeScreen(),
            PleaseLogin(),
            FindMed(),
          ]
        ),
      )
    );
  }
}

// 3. 복약 정보 등록하기 화면 - 자동 등록
class RegisterMedPage extends StatefulWidget {
  const RegisterMedPage({super.key, required this.title});

  final String title;
  @override
  State<RegisterMedPage> createState() => _RegisterMedPageState();
}

class _RegisterMedPageState extends State<RegisterMedPage> {
  int _counter = 0;
  
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            RegisterMedBar(),
            RegisterMed(),
          ]
        ),
      )
    );
  }
}
