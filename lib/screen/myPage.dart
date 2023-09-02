// 마이 페이지 
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/components/component.dart';
import 'package:flutter_application/widget/imagePickerWidgetInMypage.dart';
import 'dart:io';
import 'package:flutter_application/widget/kakaoLoginWidget.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return safeAreaPage(
    Colors.white,
    Colors.white,
      Scaffold(
        backgroundColor: white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyPageWidget()
            ],
          )
        )
      ),
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
          defaultHeader('마이 페이지', context, SizedBox(width: 30)),
          // 사진 선택 버튼
          ImagePickerWidgetMP(),
          SizedBox(
            height: 20
          ),
          // 아이디
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
          // 바
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: bar_gray,
            ),
          ),
          SizedBox(
            height: 5
          ),
          // 로그아웃, 회원 탈퇴, 개인 정보 처리방침
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoButton(
                  child: Text(
                    '로그아웃',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,    
                    )
                  ),
                  onPressed: (){},
                ),
                SizedBox(
                  height: 5
                ),
                CupertinoButton(
                  child: Text(
                    '회원 탈퇴',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,    
                    )
                  ),
                  onPressed: (){},
                ),
                SizedBox(
                  height: 5
                ),
                CupertinoButton(
                  child: Text(
                    '개인정보 처리방침',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,    
                    )
                  ),
                  onPressed: (){},
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
