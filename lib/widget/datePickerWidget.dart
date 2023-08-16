// time picker widget
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';

class CupertinoDatePickerWidget extends StatefulWidget {
  @override
  _CupertinoDatePickerWidgetState createState() =>
      _CupertinoDatePickerWidgetState();
}

class _CupertinoDatePickerWidgetState extends State<CupertinoDatePickerWidget> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              color: bright_gray,
              borderRadius: BorderRadius.circular(12)
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(47, 11, 47, 0),
            child: Text(
              '날짜 선택',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: dark_gray,
                fontSize: 15,
              )
            ),
          )
        ]
      ),
      onPressed: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildCupertinoDatePicker();
          },
        );
      },
    );
  }

  Widget _buildCupertinoDatePicker() {
    return Container(
      height: 300,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  child: Text(
                    '취소',
                    style: TextStyle(
                      color: Colors.red
                    )
                  ),
                  onPressed: (){},
                ),
                CupertinoButton(
                  child: Text(
                    '완료'
                  ),
                  onPressed: (){},
                )
              ]
            ),
          ),
          Expanded(
            flex: 10,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
          )
        ],
      )
    );
  }
}
