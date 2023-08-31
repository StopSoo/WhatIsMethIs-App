import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/components/textstyle.dart';

enum Time { breakfast, lunch, dinner }

Map<Time, Color> TimeColors = <Time, Color>{
  Time.breakfast: bright_green,
  Time.lunch: bright_green,
  Time.dinner: bright_green,
};

void main() => runApp(const MedTimeControl());

class MedTimeControl extends StatelessWidget {
  const MedTimeControl({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: MedTimeControlWidget(),
    );
  }
}

class MedTimeControlWidget extends StatefulWidget {
  const MedTimeControlWidget({super.key});

  @override
  State<MedTimeControlWidget> createState() => _MedTimeControlWidgetState();
}

class _MedTimeControlWidgetState extends State<MedTimeControlWidget> {
  Time _selectedSegment = Time.breakfast;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<Time>(
      backgroundColor: bar_gray,
      thumbColor: TimeColors[_selectedSegment]!,
      groupValue: _selectedSegment,
      onValueChanged: (Time? value) {
        if (value != null) {
          setState(() {
            _selectedSegment = value;
          });
        }
      },
      children: <Time, Widget>{
        Time.breakfast: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '아침',
            style: TextStyle(
              color: _selectedSegment == Time.breakfast ? white : dark_gray,
              fontSize: 15
            ),
          ),
        ),
        Time.lunch: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '점심',
            style: TextStyle(
              color: _selectedSegment == Time.lunch ? white : dark_gray,
              fontSize: 15
            ),          ),
        ),
        Time.dinner: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '저녁',
            style: TextStyle(
              color: _selectedSegment == Time.dinner ? white : dark_gray,
              fontSize: 15
            ),
          ),
        ),
      },
    );
  }
}
