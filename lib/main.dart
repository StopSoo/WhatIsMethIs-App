import 'package:flutter/cupertino.dart';
import 'package:flutter_application/screen/camera_result.dart';
import 'package:flutter_application/screen/medication_info.dart';
import 'package:flutter_application/screen/name_result.dart';
import 'package:flutter_application/screen/registerMedInfoAuto.dart';
import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'screen/search.dart';
import 'package:flutter_application/provider/user_provider.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: 'assets/config/.env');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'ChalKak Medicine';

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      // datePickerWidget 언어 한글로 변경
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ko', 'KO'),
      ],
      // debug 로고 제거
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: 'Inter',
          ),
        ),
      ),

      home: MedicationInfo(),

    );
  }
}
