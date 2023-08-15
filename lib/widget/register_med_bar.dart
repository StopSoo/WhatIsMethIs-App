// class RegisterMedPage
// 복약 정보 등록하기
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';

class RegisterMedBar extends StatefulWidget {
  _RegisterMedBarState createState() => _RegisterMedBarState();
}

class _RegisterMedBarState extends State<RegisterMedBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
      child: Row(
        children: [
          SizedBox(width: 7),
          CupertinoButton(
              onPressed: () {},
              minSize: 0,
              padding: EdgeInsets.all(0),
              child: Icon(CupertinoIcons.chevron_left,
                  size: 20, color: bright_green)),
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
      )
    );
  }
}
