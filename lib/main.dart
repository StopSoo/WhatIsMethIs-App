import 'package:flutter_application/screen/camera_result.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(   // 하나의 위젯(시작점)을 파라미터로 전달 받는 runApp 함수
    MyApp()
  ); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'ChalKak Medicine';
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: 'Inter',
          ),
        ),
      ),
      title: _title,
      home: CameraResult(), 
    );
  }
}
