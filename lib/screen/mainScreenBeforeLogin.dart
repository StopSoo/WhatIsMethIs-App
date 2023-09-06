// 애플리케이션 메인 화면 : 로그인 전
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/screen/loginPage.dart';
import 'package:flutter_application/screen/myPage.dart';
import 'package:flutter_application/widget/findMedWidget.dart';

class MyHomePage_before extends StatefulWidget {
  const MyHomePage_before({super.key});

  @override
  State<MyHomePage_before> createState() => _MyHomePage_beforeState();
}

class _MyHomePage_beforeState extends State<MyHomePage_before> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: PleaseLogin()
      )
    );
  }
}

class PleaseLogin extends StatelessWidget {
  const PleaseLogin({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        alignment: Alignment.topCenter,
        // 전체 Container에 왼쪽 패딩 적용
        padding: const EdgeInsets.fromLTRB(33, 80, 20, 0),
        child: Column(
          children: <Widget>[
            // 로고와 마이 페이지
            Row(
              mainAxisAlignment: MainAxisAlignment.end, 
              children: <Widget>[
                Image.asset(alignment: Alignment.topLeft, 'assets/images/icon_logo.png', fit: BoxFit.contain, height: 45),
                const Spacer(),
                CupertinoButton(
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => const MyPage()));
                  },
                  child: const Icon(
                    CupertinoIcons.person,
                    size: 28,
                    color: black,
                  ),
                ),
              ]
            ),
            const SizedBox(height: 20, width: 200),
            // 오늘의 복약 정보
            Row(
              children: <Widget>[
                CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    '오늘의 복약 정보',
                    style: TextStyle(fontSize: 24, color: black),
                  ),
                ),
                const SizedBox(height: 28, width: 10),
                CupertinoButton(
                    onPressed: () {},
                    minSize: 0,
                    padding: const EdgeInsets.all(0),
                    child: const Column(children: [
                      Icon(
                        CupertinoIcons.chevron_forward,
                        size: 28,
                        color: black,
                      ),
                    ]
                  )
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 102.0
              ),
              child: CupertinoButton(
                child: Text(
                  '로그인 후에 복약 정보를 등록해 보세요 💊', 
                  style: TextStyle(
                    fontSize: 15, 
                    color: black,
                    fontFamily: 'Inter-Regular', 
                    fontWeight: FontWeight.w500
                  )
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (_) => LoginPage()
                    )
                  );
                },
              ),
              ),
            // 알약 찾기 위젯
            const FindMedWidget()
        ]
      )
    );
  }
}
