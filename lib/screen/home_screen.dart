// class MyHomePage_after 
// 상단 바 - 로고 / 마이 페이지 / '오늘의 복약 정보' 텍스트 / 화살표 버튼
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TopBar();
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(33, 80, 20, 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // 로고와 마이 페이지
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
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
            ]),
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
          ],
        ));
  }
}
