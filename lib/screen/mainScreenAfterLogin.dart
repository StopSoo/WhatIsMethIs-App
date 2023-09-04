// 애플리케이션 메인 화면 : 로그인 후
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/screen/medication_info.dart';
import 'package:flutter_application/screen/myPage.dart';
import 'package:flutter_application/widget/findMedWidget.dart';

class MyHomePage_after extends StatefulWidget {
  const MyHomePage_after({super.key});

  @override
  State<MyHomePage_after> createState() => _MyHomePage_afterState();
}

class _MyHomePage_afterState extends State<MyHomePage_after> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: SingleChildScrollView(child: HomeScreen()));
  }
}

class HomeScreen extends StatelessWidget {
  // 알약 찾기 위젯 번호
  int currentIndexPage = 0;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // 전체 Container에 왼쪽 패딩 적용
        padding: const EdgeInsets.fromLTRB(33, 80, 20, 0),
        child: Column(
          children: <Widget>[
            // 로고와 마이 페이지
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Image.asset(alignment: Alignment.topLeft, 'assets/images/icon_logo.png', fit: BoxFit.contain, height: 45),
              const Spacer(),
              CupertinoButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    CupertinoPageRoute(builder: (context) => const MyPage())
                  );
                },
                child: const Icon(
                  CupertinoIcons.person,
                  size: 28,
                  color: black,
                ),
              ),
            ]),
            const SizedBox(height: 20, width: 200),
            // 오늘의 복약 정보
            Row(
              children: <Widget>[
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const MedicationInfo();
                      },
                    ));
                  },
                  minSize: 0,
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    '오늘의 복약 정보',
                    style: TextStyle(fontSize: 24, color: black),
                  ),
                ),
                const SizedBox(height: 28, width: 10),
                CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const MedicationInfo();
                        },
                      ));
                    },
                    minSize: 0,
                    padding: const EdgeInsets.all(0),
                    child: const Column(children: [
                      Icon(
                        CupertinoIcons.chevron_forward,
                        size: 28,
                        color: black,
                      ),
                    ])),
              ],
            ),
            // 해당 날짜의 복약 정보
            Container(
                child: Column(children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: main_color_green),
                        ),
                        Container(margin: const EdgeInsets.fromLTRB(29, 26, 28, 29), child: const Text('💊', style: TextStyle(fontSize: 24)))
                      ],
                    ),
                    const SizedBox(height: 80, width: 18),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '점심 직후',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 6),
                        Row(children: <Widget>[
                          Text(
                            '타이레놀8시간이알서방정',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(width: 17),
                          Text(
                            '1정',
                            style: TextStyle(fontSize: 15),
                          )
                        ]),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20, width: 100),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: main_color_green),
                        ),
                        Container(margin: const EdgeInsets.fromLTRB(29, 26, 28, 29), child: const Text('💊', style: TextStyle(fontSize: 24)))
                      ],
                    ),
                    const SizedBox(height: 80, width: 18),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '저녁 식후',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 6),
                        Row(children: <Widget>[
                          Text(
                            '타이레놀8시간이알서방정',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(width: 17),
                          Text(
                            '1정',
                            style: TextStyle(fontSize: 15),
                          )
                        ]),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    '더보기',
                    style: TextStyle(fontSize: 15, color: black),
                  ),
                ),
                const SizedBox(height: 22, width: 4),
                CupertinoButton(
                    onPressed: () {},
                    minSize: 0,
                    padding: const EdgeInsets.all(0),
                    child: const Icon(
                      CupertinoIcons.chevron_down,
                      size: 25,
                      color: black,
                    )),
              ]))
            ])),
            const SizedBox(height: 56),
            // 알약 찾기 위젯
            const FindMedWidget()
          ],
        ));
  }
}
