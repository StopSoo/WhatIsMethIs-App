import "package:flutter/material.dart";

void main() {
  runApp(MyApp()); // 하나의 위젯(시작점)을 파라미터로 전달 받는 runApp 함수
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Text('Hello World'),
        ));
  }
}
