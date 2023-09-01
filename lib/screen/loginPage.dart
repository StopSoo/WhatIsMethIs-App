import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/components/component.dart';
import 'package:flutter_application/components/decorations.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/widget/kakaoLoginWidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String inputEmail = "";
  String inputPassword = "";

  @override
  Widget build(BuildContext context) {
    return safeAreaPage(
      Colors.white,
      Colors.white,
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                minSize: 0,
                padding: const EdgeInsets.only(left: 7.0),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: bright_green,
                  size: 27,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                "로그인",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: charcoal,
                ),
              ),
              const SizedBox(width: 31),
            ],
          ),
          const SizedBox(height: 144),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 43.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.0),
                      child: Text(
                        "이메일",
                        style: TextStyle(
                          fontSize: 18,
                          color: real_black,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                CupertinoTextField(
                  padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
                  style: const TextStyle(color: CupertinoColors.black),
                  placeholder: "example@gmail.com",
                  placeholderStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: dark_gray,
                  ),
                  onChanged: (text) {
                    setState(() {
                      inputEmail = text;
                    });
                  },
                  decoration: textFieldDecoration(),
                ),
                const SizedBox(height: 20),
                // 비밀번호
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.0),
                      child: Text(
                        "비밀번호",
                        style: TextStyle(
                          fontSize: 18,
                          color: real_black,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                CupertinoTextField(
                  padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
                  style: const TextStyle(color: CupertinoColors.black),
                  placeholder: "********",
                  placeholderStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: dark_gray,
                  ),
                  onChanged: (text) {
                    setState(() {
                      inputPassword = text;
                    });
                  },
                  decoration: textFieldDecoration(),
                ),

                const SizedBox(height: 20),

                // 비밀번호 찾기 / 회원가입
                const Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Text(
                    "비밀번호 찾기 | 회원가입",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: charcoal,
                    ),
                  ),
                ),

                // 소셜 로그인
                const SizedBox(height: 40),

                const Text(
                  "간편 로그인",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: real_black,
                  ),
                ),
                const SizedBox(height: 15),
                // 카카오 로그인 버튼
                KakaoLogin()
                // 애플 로그인 버튼
              ],
            ),
          ),
        ],
      ),
    );
  }
}
