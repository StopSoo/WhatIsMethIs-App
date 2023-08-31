import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';


Map<String, Color> MealTimeColors = <String, Color>{
  "BREAKFAST": bright_green,
  "LUNCH": bright_green,
  "DINNER": bright_green,
};

class MedTimeNotChangedWidget extends StatelessWidget {
  final String selectedSegment; // 선택될 옵션

  const MedTimeNotChangedWidget({super.key, required this.selectedSegment});

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<String>(
      backgroundColor: bar_gray,
      thumbColor: MealTimeColors[selectedSegment]!,
      groupValue: selectedSegment,
      onValueChanged: (String? value) {
               },
      children: <String, Widget>{
        "BREAKFAST": Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '아침',
            style: TextStyle(
              color: selectedSegment == "BREAKFAST" ? white : dark_gray,
              fontSize: 15
            ),
          ),
        ),
        "LUNCH": Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '점심',
            style: TextStyle(
              color: selectedSegment == "LUNCH" ? white : dark_gray,
              fontSize: 15
            ),
          ),
        ),
        "DINNER": Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '저녁',
            style: TextStyle(
              color: selectedSegment == "DINNER" ? white : dark_gray,
              fontSize: 15
            ),
          ),
        ),
      },
    );
  }
}
  