import 'package:flutter/cupertino.dart';
import 'package:flutter_application/screen/mainScreenAfterLogin.dart';
import 'package:flutter_application/provider/user_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();
  KakaoSdk.init(nativeAppKey: '177ec17efa9ed10f54f86aaa8923b68e');
   runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // datePickerWidget 언어 한글로 변경
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KO'),
      ],
      // debug 로고 제거
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: 'Inter',
          ),
        ),
      ),

      home: MyHomePage_after(),
    );
  }
}
