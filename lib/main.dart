import 'package:flutter/cupertino.dart';
import 'package:flutter_application/screen/camera_result.dart';
import 'package:flutter_application/screen/emergency_contact.dart';
import 'package:flutter_application/screen/medication_info.dart';
import 'package:flutter_application/screen/medication_info_delete.dart';
import 'package:flutter_application/screen/search.dart';
import 'screen/name_result.dart';



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
            fontFamily: 'Inter',
          ),
        ),
      ),
      title: _title,
      home: MedicationInfo(), 
    );
  }
}
