// class
// 복약 정보 등록하기
import 'package:flutter/material.dart';

class RegisterMed extends StatefulWidget {
  _RegisterMedState createState() => _RegisterMedState();
}

class _RegisterMedState extends State<RegisterMed> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RegisterMedWidget();
  }
}

class RegisterMedWidget extends StatelessWidget {
  List<String> dropdownList = ['1정', '2정', '3정', '4정', '5정'];
  String selectedDropDown = '1정';
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                width: 7
              ),
              InkWell(
                  onTap: () {},
                  child: Image.asset('images/icon_arrow_left.png',
                      alignment: Alignment.bottomRight,
                      fit: BoxFit.contain,
                      height: 20)),
              SizedBox(width: 130),
              Text(
                '복약 정보 등록하기',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(155, 36, 155, 0),
            child: Image.asset(
              'images/icon_register_pic.png',
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(80, 18, 0, 0),
            child: Row(
              children: [
                Text(
                  '타이레놀8시간이알서방정',
                  style: TextStyle(
                    fontSize: 15,
                  )
                ),
                SizedBox(
                  width: 12
                ),
                // DropdownButton<String>(
                //   value: selectedDropDown,
                //   onChanged: (dynamic newValue) {
                //     setState(() {
                //       selectedDropDown = newValue;
                //     });
                //   },
                //   items: dropdownList.map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // )
              ]
            )
          ),
          SizedBox(
            height: 18
          ),
          Container(
            padding: EdgeInsets.fromLTRB(36, 27, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '복용 기간',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              )
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/icon_date_bar.png',
                  width: 150,
                ),
                SizedBox(
                  width: 5
                ),
                Image.asset(
                  'images/icon_wave.png',
                  height: 14
                ),
                SizedBox(
                  width: 5
                ),
                Image.asset(
                  'images/icon_date_bar.png',
                  width: 150,
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
