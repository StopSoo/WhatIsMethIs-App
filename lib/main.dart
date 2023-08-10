import 'package:flutter/cupertino.dart';

import 'pages/camera_result.dart';

void main() async{
  runApp(const MyApp());
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
            fontFamily: 'NotoSansKR',
          ),
        ),
      ),
      title: _title,
      home: CameraResult(), 
    );
  }
}
