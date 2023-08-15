// class MyHomePage_before
// 로그인 전 화면 - 로그인 후에 복약 정보를 등록해보세요
import 'package:flutter/material.dart';

class PleaseLogin extends StatefulWidget {
  _PleaseLoginState createState() => _PleaseLoginState();
}

class _PleaseLoginState extends State<PleaseLogin> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PleaseLoginWidget();
  }
}

class PleaseLoginWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      padding: EdgeInsets.fromLTRB(35, 101, 38, 177),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          '로그인 후에 복약 정보를 등록해 보세요 💊',
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'Inter-Regular',
            fontWeight: FontWeight.w500)
        ) 
      )
    );
  }
}
