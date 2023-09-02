// 마이 페이지
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/components/component.dart';
import 'package:flutter_application/widget/imagePickerWidgetInMypage.dart';

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
      const Scaffold(
          backgroundColor: white,
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
              child: Column(
            children: [MyPageWidget()],
          ))),
    );
  }
}

class MyPageWidget extends StatefulWidget {
  const MyPageWidget({super.key});

  @override
  _MyPageWidgetState createState() => _MyPageWidgetState();
}

class _MyPageWidgetState extends State<MyPageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        defaultHeader('마이 페이지', context, const SizedBox(width: 30)),
        // 사진 선택 버튼
        const ImagePickerWidgetMP(),
        const SizedBox(height: 20),
        // 아이디
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hong123', style: TextStyle(color: dark_gray, fontWeight: FontWeight.w600)),
            SizedBox(width: 5),
            Icon(CupertinoIcons.doc_on_doc, size: 18, color: dark_gray)
          ],
        ),
        const SizedBox(height: 40),
        // 바
        Container(
          height: 8,
          decoration: const BoxDecoration(
            color: bar_gray,
          ),
        ),
        const SizedBox(height: 5),
        // 로그아웃, 회원 탈퇴, 개인 정보 처리방침
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoButton(
                child: const Text('로그아웃',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,
                    )),
                onPressed: () {},
              ),
              const SizedBox(height: 5),
              CupertinoButton(
                child: const Text('회원 탈퇴',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,
                    )),
                onPressed: () {},
              ),
              const SizedBox(height: 5),
              CupertinoButton(
                child: const Text('개인정보 처리방침',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,
                    )),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
