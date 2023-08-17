// 마이 페이지 
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key, required this.title});

  final String title;
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
          children: [
            MyPageWidget()
          ],
        )
      )
    );
  }
}

class MyPageWidget extends StatefulWidget {
  _MyPageWidgetState createState() => _MyPageWidgetState();
}

class _MyPageWidgetState extends State<MyPageWidget> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 7),
                CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    CupertinoIcons.chevron_left,
                    size: 20, 
                    color: bright_green
                  )
                ),
                SizedBox(width: 130),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '마이 페이지',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 156),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(155, 36, 155, 0),
            child: Stack(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 5.0,
                        offset: Offset(0, 10), // changes position of shadow
                      ),
                    ],
                    color: white
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(26, 26, 26, 26),
                  child: Icon(
                    CupertinoIcons.photo_on_rectangle,
                    size: 28,
                    color: dark_gray,
                  )
                )
              ],
            ),
          ),
          SizedBox(
            height: 20
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'hong123',
                style: TextStyle(
                  color: dark_gray,
                  fontWeight: FontWeight.w600
                )
              ),
              SizedBox(
                width: 5
              ),
              Icon(
                CupertinoIcons.doc_on_doc,
                size: 18,
                color: dark_gray
              )
            ],
          ),
          SizedBox(
            height: 40
          ),
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: bar_gray,
            ),
          ),
          SizedBox(
            height: 20
          ),
          // 일단 급해서 텍스트로 해놨는데 버튼 형식으로 다시 구현하겠슴다 !
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            height: 40,
            child: Text(
              '로그아웃',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300
              )
            )
          ),
          SizedBox(
            height: 20
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            height: 40,
            child: Text(
              '회원 탈퇴',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300
              )
            )
          ),
          SizedBox(
            height: 20
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            height: 30,
            child: Text(
              '개인정보 처리방침',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300
              )
            )
          ),
        ],
      )
    );
  }
}
