// 복약 주기 체크 위젯
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';

const double _kItemExtent = 32.0;
const List<String> _medCounts = <String>[
  '1 일',
  '2 일',
  '3 일',
  '4 일',
  '5 일',
  '6 일',
  '7 일',
];

void main() => runApp(const MedCyclePicker());

class MedCyclePicker extends StatelessWidget {
  const MedCyclePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: MedCyclePickerWidget(selectedCycle: 0,),
    );
  }
}
typedef MedCycleChangedCallback = void Function(int newCycle);


class MedCyclePickerWidget extends StatefulWidget {
  int selectedCycle;
  MedCycleChangedCallback? onMedCycleChanged; // Define the callback function.

  MedCyclePickerWidget({super.key, required this.selectedCycle, this.onMedCycleChanged});

  @override
  State<MedCyclePickerWidget> createState() => _MedCyclePickerWidgetState();
}

class _MedCyclePickerWidgetState extends State<MedCyclePickerWidget> {

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
              Expanded(flex: 20, child: child),
            ])),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            minSize: 0.0,
            padding: EdgeInsets.fromLTRB(13, 9, 8, 9),
            color: bright_gray,
            onPressed: () => _showDialog(
              CupertinoPicker(
                magnification: 1.22,
                squeeze: 1.2,
                useMagnifier: true,
                itemExtent: _kItemExtent,
                scrollController: FixedExtentScrollController(
                  initialItem: widget.selectedCycle,
                ),
                onSelectedItemChanged: (int selectedItem) {
                  setState(() {
                    widget.selectedCycle = selectedItem;
                  widget.onMedCycleChanged?.call(widget.selectedCycle);

                  });
                },
                children:
                    List<Widget>.generate(_medCounts.length, (int index) {
                  return Center(child: Text(_medCounts[index]));
                }),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 140
                ),
                Text(
                  _medCounts[widget.selectedCycle],
                  style: const TextStyle(fontSize: 15.0, color: dark_gray),
                ),
                SizedBox(width: 120),
                Icon(
                  CupertinoIcons.chevron_down,
                  size: 15,
                  color: black,
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
