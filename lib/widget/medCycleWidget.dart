// 복약 주기 체크 위젯 
import 'dart:ui';
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
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: MedCyclePickerWidget(),
    );
  }
}

class MedCyclePickerWidget extends StatefulWidget {
  const MedCyclePickerWidget({super.key});

  @override
  State<MedCyclePickerWidget> createState() => _MedCyclePickerWidgetState();
}

class _MedCyclePickerWidgetState extends State<MedCyclePickerWidget> {
  int _selectedCycle = 0;

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
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318,
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
                    initialItem: _selectedCycle,
                  ),
                  onSelectedItemChanged: (int selectedItem) {
                    setState(() {
                      _selectedCycle = selectedItem;
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
                    _medCounts[_selectedCycle],
                    style: const TextStyle(fontSize: 15.0, color: dark_gray),
                  ),
                  SizedBox(width: 111),
                  Icon(
                    CupertinoIcons.chevron_down,
                    size: 15,
                    color: black,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
