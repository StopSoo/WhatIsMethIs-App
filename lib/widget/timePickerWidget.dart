// 복약 알림 시간 설정 위젯
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';

void main() => runApp(const DatePickerApp());

class DatePickerApp extends StatelessWidget {
  const DatePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KO'),
      ],
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: DatePickerExample(time: DateTime.now(),),
    );
  }
}

typedef TimePickerChangedCallback = void Function(DateTime newTime);


class DatePickerExample extends StatefulWidget {
  DateTime time;
  TimePickerChangedCallback? onTimePickerChanged;

  DatePickerExample({super.key, required this.time, this.onTimePickerChanged});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateFormat dateFormat = DateFormat('aa hh:mm');

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 300,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
            top: false,
            child: Column(children: [
              Expanded(
                flex: 6,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: Text('취소', style: TextStyle(color: Colors.red)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoButton(
                      child: Text('완료'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ]
                ),
              ),
              Expanded(
                flex: 20, 
                child: child
              ),
            ])),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 330,
        height: 50,
        child: CupertinoPageScaffold(
          child: DefaultTextStyle(
            style: TextStyle(
              color: white,
              fontSize: 15.0,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _DatePickerItem(
                    children: <Widget>[
                      CupertinoButton(
                        onPressed: () => _showDialog(
                          CupertinoDatePicker(
                            initialDateTime: widget.time,
                            mode: CupertinoDatePickerMode.time,
                            use24hFormat: false,
                            onDateTimeChanged: (DateTime newTime) {
                              setState(() => widget.time = newTime);
                            },
                          ),
                        ),
                        child: Center(
                          child: Text(
                            dateFormat.format(widget.time),
                            style: const TextStyle(
                                fontSize: 15.0, color: dark_gray),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      );
  }
}

class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: bright_gray,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      )
    );
  }
}
