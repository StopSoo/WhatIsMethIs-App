// class MyHomePage_after 
// 상단 바 - 로고 / 마이 페이지 / '오늘의 복약 정보' 텍스트 / 화살표 버튼
import 'package:flutter/material.dart';

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
              Image.asset('images/icon_person.png',
                  fit: BoxFit.contain, height: 45)
            ]),
            SizedBox(height: 20, width: 200),
            // 오늘의 복약 정보
            Row(
              children: <Widget>[
                Container(
                  child: Text(
                    '오늘의 복약 정보',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(height: 28, width: 10),
                InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'images/icon_arrow_right.png',
                      alignment: Alignment.bottomRight,
                      fit: BoxFit.contain,
                      height: 28
                    )
                ),
              ],
            ),
          ],
        ));
  }
}
