import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';


Map<String, Color> MealTimeColors = <String, Color>{
  "BREAKFAST": bright_green,
  "LUNCH": bright_green,
  "DINNER": bright_green,
};

typedef MedTimeChangedCallback = void Function(String newSegment);


class MedTimeNotChangedWidget extends StatefulWidget {
  String selectedSegment; // 선택될 옵션
  final MedTimeChangedCallback? onMedTimeChanged; // Define the callback function.


  MedTimeNotChangedWidget({super.key, required this.selectedSegment, this.onMedTimeChanged});

  @override
  State<MedTimeNotChangedWidget> createState() => _MedTimeNotChangedWidgetState();
}

class _MedTimeNotChangedWidgetState extends State<MedTimeNotChangedWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<String>(
      backgroundColor: bar_gray,
      thumbColor: MealTimeColors[widget.selectedSegment]!,
      groupValue: widget.selectedSegment,
      onValueChanged: (String? value) {
        if (value != null) {
          setState(() {
            widget.selectedSegment = value;
            widget.onMedTimeChanged?.call(widget.selectedSegment);

          });
        }
               },
      children: <String, Widget>{
        "BREAKFAST": Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '아침',
            style: TextStyle(
              color: widget.selectedSegment == "BREAKFAST" ? white : dark_gray,
              fontSize: 15
            ),
          ),
        ),
        "LUNCH": Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '점심',
            style: TextStyle(
              color: widget.selectedSegment == "LUNCH" ? white : dark_gray,
              fontSize: 15
            ),
          ),
        ),
        "DINNER": Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '저녁',
            style: TextStyle(
              color: widget.selectedSegment == "DINNER" ? white : dark_gray,
              fontSize: 15
            ),
          ),
        ),
      },
    );
  }
}
  