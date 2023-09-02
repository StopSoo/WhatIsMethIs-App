import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';


Map<String, Color> BeforeAfterColors = <String, Color>{
  "BEFORE": bright_green,
  "AFTER": bright_green,
};
typedef MedTimeChangedCallback = void Function(String newSegment);

class MedTimeBeAfNotChangedWidget extends StatefulWidget {
  String selectedSegment; // 선택될 옵션
  MedTimeChangedCallback? onMedTimeChanged; // Define the callback function.


MedTimeBeAfNotChangedWidget({super.key, required this.selectedSegment, this.onMedTimeChanged});

  @override
  State<MedTimeBeAfNotChangedWidget> createState() => _MedTimeBeAfNotChangedWidgetState();
}

class _MedTimeBeAfNotChangedWidgetState extends State<MedTimeBeAfNotChangedWidget> {
  @override
  Widget build(BuildContext context){
    return CupertinoSlidingSegmentedControl<String>(
      backgroundColor: bar_gray,
      thumbColor: BeforeAfterColors[widget.selectedSegment]!,
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
        "BEFORE": Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '식전',
            style: TextStyle(
              color: widget.selectedSegment == "BEFORE" ? white : dark_gray,
              fontSize: 15
            ),
          ),
        ),
        "AFTER": Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            '식후',
            style: TextStyle(
              color: widget.selectedSegment == "AFTER" ? white : dark_gray,
              fontSize: 15
            ),
          ),
        ),
      },
    );
  }
}