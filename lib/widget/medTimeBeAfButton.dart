import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';

enum Time { before, after }

Map<Time, Color> TimeColors = <Time, Color>{
  Time.before: bright_green,
  Time.after: bright_green,
};

void main() => runApp(const MedTimeControl());

class MedTimeControl extends StatelessWidget {
  const MedTimeControl({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: MedTimeBeAfControlWidget(),
    );
  }
}

class MedTimeBeAfControlWidget extends StatefulWidget {
  const MedTimeBeAfControlWidget({super.key});

  @override
  State<MedTimeBeAfControlWidget> createState() =>
      _MedTimeBeAfControlWidgetState();
}

class _MedTimeBeAfControlWidgetState extends State<MedTimeBeAfControlWidget> {
  Time _selectedSegment = Time.before;

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
      children: const <Time, Widget>{
        Time.before: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '식전',
            style: TextStyle(
              color: dark_gray,
              fontSize: 15
            ),
          ),
        ),
        Time.after: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '식후',
            style: TextStyle(
              color: dark_gray,
              fontSize: 15
            ),
          ),
        ),
      },
    );
  }
}
