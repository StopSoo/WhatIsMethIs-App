import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';


Map<String, Color> BeforeAfterColors = <String, Color>{
  "BEFORE": bright_green,
  "AFTER": bright_green,
};

class MedTimeBeAfNotChangedWidget extends StatelessWidget {
  final String selectedSegment; // 선택될 옵션

const MedTimeBeAfNotChangedWidget({super.key, required this.selectedSegment});

  @override
  Widget build(BuildContext context){
    return CupertinoSlidingSegmentedControl<String>(
      backgroundColor: bar_gray,
      thumbColor: BeforeAfterColors[selectedSegment]!,
      groupValue: selectedSegment,
      onValueChanged: (String? value) {
    
      },
      children: <String, Widget>{
        "BEFORE": Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '식전',
            style: TextStyle(
              color: selectedSegment == "BEFORE" ? white : dark_gray,
              fontSize: 15
            ),
          ),
        ),
        "AFTER": Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '식후',
            style: TextStyle(
              color: selectedSegment == "AFTER" ? white : dark_gray,
              fontSize: 15
            ),
          ),
        ),
      },
    );
  }
}