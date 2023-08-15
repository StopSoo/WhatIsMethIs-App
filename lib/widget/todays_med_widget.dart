// class MyHomePage_after 
// 오늘의 복약 정보 위젯
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';

class TodaysMed extends StatefulWidget {
  _TodaysMedState createState() => _TodaysMedState();
}

class _TodaysMedState extends State<TodaysMed> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MedWidget();
  }
}

class MedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(33, 24, 0, 0),
            child: Row(
              children: [
                Image.asset(
                  'images/icon_todays_med.png',
                  fit: BoxFit.contain,
                  height: 80
                ),
                SizedBox(
                  height: 80,
                  width: 18
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '점심 직후',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 6
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '타이레놀8시간이알서방정',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          width: 17
                        ),
                        Text(
                          '1정',
                          style: TextStyle(fontSize: 15),
                        )
                      ]
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
                height: 20,
                width: 100
          ),
          Container(
            padding: EdgeInsets.fromLTRB(33, 0, 0, 0),
            child: Row(
              children: [
                Image.asset(
                  'images/icon_todays_med.png',
                  fit: BoxFit.contain,
                  height: 80
                ),
                SizedBox(
                  height: 80,
                  width: 18
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '저녁 식후',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 6
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '타이레놀8시간이알서방정',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          width: 17
                        ),
                        Text(
                          '1정',
                          style: TextStyle(fontSize: 15),
                        )
                      ]
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height:20
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: EdgeInsets.all(0),
                  child: Text(
                  '더보기',
                  style: TextStyle(
                    fontSize: 15,
                    color: black
                  ),
                  ),
                ),
                SizedBox(
                  height: 22,
                  width: 4
                ),
                CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    CupertinoIcons.chevron_down,
                    size: 25,
                    color: black,
                  )
                ),
              ]
            )
          )
        ]
      )
    );
  }
}
