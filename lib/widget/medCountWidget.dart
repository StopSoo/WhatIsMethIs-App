// 알약 개수 체크 위젯
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';

/// Flutter code sample for [CupertinoPicker].

const double _kItemExtent = 32.0;
const List<String> _medCounts = <String>[
  '1 정',
  '2 정',
  '3 정',
  '4 정',
  '5 정',
];

void main() => runApp(const MedCountPickerApp());

class MedCountPickerApp extends StatelessWidget {
  const MedCountPickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: MedCountPickerWidget(),
    );
  }
}

class MedCountPickerWidget extends StatefulWidget {
  const MedCountPickerWidget({super.key});

  @override
  State<MedCountPickerWidget> createState() => _MedCountPickerWidgetState();
}

class _MedCountPickerWidgetState extends State<MedCountPickerWidget> {
  int _selectedCount = 0;

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
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
              minSize: 0.0,
              padding: const EdgeInsets.fromLTRB(13, 9, 8, 9),
              color: bright_gray,
              onPressed: () => _showDialog(
                    CupertinoPicker(
                      magnification: 1.22,
                      squeeze: 1.2,
                      useMagnifier: true,
                      itemExtent: _kItemExtent,
                      scrollController: FixedExtentScrollController(
                        initialItem: _selectedCount,
                      ),
                      onSelectedItemChanged: (int selectedItem) {
                        setState(() {
                          _selectedCount = selectedItem;
                        });
                      },
                      children: List<Widget>.generate(_medCounts.length, (int index) {
                        return Center(child: Text(_medCounts[index]));
                      }),
                    ),
                  ),
              child: Row(
                children: [
                  Text(
                    _medCounts[_selectedCount],
                    style: const TextStyle(fontSize: 15.0, color: dark_gray),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
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
