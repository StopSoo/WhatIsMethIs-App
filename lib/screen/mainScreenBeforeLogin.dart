// class MyHomePage_before
// 로그인 전 화면 - 로그인 후에 복약 정보를 등록해보세요
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';

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
      body: PleaseLogin()
    );
  }
}

class PleaseLogin extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      // 전체 Container에 왼쪽 패딩 적용
      padding: EdgeInsets.fromLTRB(33, 80, 20, 0),
      child: Column(
        children: <Widget>[
          // 로고와 마이 페이지
          Row(
            mainAxisAlignment: MainAxisAlignment.end, 
            children: <Widget>[
              Image.asset(
                alignment: Alignment.topLeft,
                'images/icon_logo.png',
                fit: BoxFit.contain,
                height: 45),
              Spacer(),
              CupertinoButton(
                onPressed: () {},
                child: Icon(
                CupertinoIcons.person,
                size: 28,
                color: black,
                ),
              ),
            ]
          ),
          SizedBox(
            height: 20, 
            width: 200
          ),
          // 오늘의 복약 정보
          Row(
            children: <Widget>[
              CupertinoButton(
                onPressed: () {},
                minSize: 0,
                padding: EdgeInsets.all(0),
                child: Text(
                  '오늘의 복약 정보',
                  style: TextStyle(
                    fontSize: 24,
                    color: black
                  ),
                ),
              ),
              SizedBox(height: 28, width: 10),
              CupertinoButton(
                onPressed: () {},
                minSize: 0,
                padding: EdgeInsets.all(0),
                child: Column(
                  children: [
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
            width: 330,
            padding: EdgeInsets.fromLTRB(35, 101, 38, 177),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text('로그인 후에 복약 정보를 등록해 보세요 💊',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Inter-Regular',
                  fontWeight: FontWeight.w500
                )
              )
            )
          ),
          // 알약 찾기 위젯 가로 스크롤
          Container(
            padding: EdgeInsets.fromLTRB(33, 0, 0, 0),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // 가로 스크롤
                child: Row(
                  children: [
                    CupertinoButton(
                      onPressed: () {},
                      minSize: 0,
                      padding: EdgeInsets.all(0),
                      child: Stack(children: [
                        Container(
                          width: 217,
                          height: 268,
                          decoration: BoxDecoration(
                            color: main_color_yellow,
                            borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(26, 133, 98, 81),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              '사진으로\n알약 찾기',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter-ExtraBold',
                                color: black
                              ),
                            )
                          )
                        ),
                        SizedBox(width: 26),
                        Container(
                          margin: EdgeInsets.fromLTRB(26, 53, 0, 0),
                          child: Icon(
                            CupertinoIcons.photo_on_rectangle,
                            size: 28,
                            color: Color(0xFF9A9526),
                          )
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(28, 201, 32, 23),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '알약을 카메라로 찍으면\n이름을 알려줘요',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                                fontFamily: 'Inter-ExtraBold',
                                color: black
                              ),
                            )
                          )
                        )
                      ]
                    )
                    ),
                    SizedBox(width: 33, height: 268),
                    CupertinoButton(
                      onPressed: () {},
                      minSize: 0,
                      padding: EdgeInsets.all(0),
                      child: Stack(children: [
                        Container(
                          width: 217,
                          height: 268,
                          decoration: BoxDecoration(
                            color: main_color_green,
                            borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(26, 133, 98, 81),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              '이름으로\n알약 찾기',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter-ExtraBold',
                                color: black
                              ),
                            )
                          )
                        ),
                        SizedBox(width: 26),
                        Container(
                          margin: EdgeInsets.fromLTRB(26, 53, 0, 0),
                          child: Icon(
                            CupertinoIcons.textformat,
                            size: 28,
                            color: Color(0xFF5EAB39),
                          )
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(28, 201, 32, 23),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '이름을 검색하면\n알약 이미지를 알려줘요',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                                fontFamily: 'Inter-ExtraBold',
                                color: black
                              ),
                            )
                          )
                        )
                      ]
                    )),
                    SizedBox(width: 33, height: 268),
                    CupertinoButton(
                      onPressed: () {},
                      child: Stack(
                        children: [
                          Container(
                          width: 217,
                          height: 268,
                          decoration: BoxDecoration(
                            color: main_color_yellow,
                            borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                          Container(
                            padding: EdgeInsets.fromLTRB(26, 133, 98, 81),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                '비상 연락망\n등록하기',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Inter-ExtraBold',
                                  color: black
                                ),
                              )
                            )
                          ),
                          SizedBox(width: 26),
                          Container(
                            margin: EdgeInsets.fromLTRB(26, 53, 0, 0),
                            child: Icon(
                              CupertinoIcons.exclamationmark_circle_fill,
                              size: 28,
                              color: Color(0xFF9A9526),
                            )
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(28, 201, 32, 23),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                '약을 먹지 않으면\n등록된 번호로 알림을 보내요',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: 'Inter-ExtraBold',
                                  color: black
                                ),
                              )
                            )
                          )
                      ]
                    )
                  ),
                ],
              )
            )
          )
        ] 
      )
    );
  }
}
