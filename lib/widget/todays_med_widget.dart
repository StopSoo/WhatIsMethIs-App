// class MyHomePage_after 
// 오늘의 복약 정보 위젯
import 'package:flutter/material.dart';

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
      padding: EdgeInsets.fromLTRB(33, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
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
          SizedBox(
                height: 20,
                width: 100
          ),
          Row(
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
          SizedBox(
            height:20
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '더보기',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 22,
                width: 4
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  'images/icon_arrow_bottom.png',
                  fit: BoxFit.contain,
                  height: 22
                )
              ),
            ]
          )
        ]
      )
    );
  }
}
