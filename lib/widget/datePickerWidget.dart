// date picker widget
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';

typedef DateChangedCallback = void Function(DateTime newDate);

class DatePickerWidget extends StatefulWidget {
  DateTime selectedDate;
  final DateChangedCallback? onDateChanged; // Define the callback function.

  DatePickerWidget({super.key, required this.selectedDate, this.onDateChanged});

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  // DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Stack(children: [
        Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(color: bright_gray, borderRadius: BorderRadius.circular(12)),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(19, 9, 0, 0),
          child: Text('${widget.selectedDate.year}년 ${widget.selectedDate.month}월 ${widget.selectedDate.day}일',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: dark_gray,
                fontSize: 15,
              )),
        )
      ]),
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
      color: CupertinoColors.systemBackground.resolveFrom(context),
      height: 350,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CupertinoButton(
                child: const Text('취소', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoButton(
                child: const Text('완료'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]),
          ),
          Expanded(
            flex: 15,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newDate) {
                setState(() {
                  widget.selectedDate = newDate;
                  widget.onDateChanged?.call(widget.selectedDate);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
