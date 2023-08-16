import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/medication_info_delete.dart';

import '../components/colors.dart';
import '../components/component.dart';
import '../components/textstyle.dart';

class MedicationInfo extends StatefulWidget {
  const MedicationInfo({Key? key}) : super(key: key);

  @override
  _MedicationInfoState createState() => _MedicationInfoState();
}

class _MedicationInfoState extends State<MedicationInfo> {
  List<String> lunch = [
    "아침",
    "점심",
    "아침",
    "점심",
    "아침",
    "저녁",
    "아침",
    "점심",
    "아침",
    "점심"
  ];
  List<String> after = [
    "식후",
    "식후",
    "식전",
    "식후",
    "식전",
    "식후",
    "식후",
    "식후",
    "식전",
    "식후"
  ];
  List<String> itemName = [
    "타이레놀6시간이알서방정",
    "타이레놀7시간이알서방정",
    "타이레놀8시간이알서방정",
    "타이레놀9시간이알서방정",
    "타이레놀10시간이알서방정",
    "타이레놀11시간이알서방정",
    "타이레놀12시간이알서방정",
    "타이레놀13시간이알서방정",
    "타이레놀14시간이알서방정",
    "타이레놀15시간이알서방정",
  ];
  List<int> cnt = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  List<String> images = [
    "",
    'assets/image/test_cat.jpg',
    'assets/image/test_cat.jpg',
    'assets/image/test_cat.jpg',
    "",
    'assets/image/test_cat.jpg',
    'assets/image/test_cat.jpg',
    'assets/image/test_cat.jpg',
    'assets/image/test_cat.jpg',
    'assets/image/test_cat.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return safeAreaPage(
      Colors.white,
      Colors.white,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          defaultHeader("복약 정보 조회하기", context,
            CupertinoButton(
              minSize: 0,
              padding: EdgeInsets.all(0),
              onPressed: () {
                _showActionSheet(context);
              },
              child: Icon(
                CupertinoIcons.ellipsis,
                color: Colors.black.withOpacity(0.9),
                size: 28,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: lunch.length,
                itemBuilder: (BuildContext context, int index) =>
                    pillShortInfoBox(images[index], lunch[index], after[index],
                        itemName[index], cnt[index])),
          ),
        ],
      ),
    );
  }

  CupertinoButton pillShortInfoBox(
      String image, String lunch, String after, String itemName, int cnt) {
    return CupertinoButton(
      onPressed: () => {
        //Todo: Navigate to pillDetail
      },
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // * Left Image
          Container(
            margin: const EdgeInsets.only(right: 25),
            child: CircleAvatar(
              backgroundColor: mainColor,
              radius: 40,
              child: image.isEmpty
                  ? const Text("💊")
                  : CircleAvatar(
                      backgroundImage: AssetImage(image),
                      radius: 38,
                    ),
            ),
          ),
          // * Right Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$lunch $after", style: blackTextStyle(16)),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(itemName, style: darkGrayTextStyle(15), softWrap: true,),
                  const SizedBox(width: 15),
                  Text( "${cnt}정", style: darkGrayTextStyle(15), softWrap: true,),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              //Todo: Navigate to 복약정보 등록
              Navigator.pop(context);
            },
            child: const Text('복약 정보 등록하기', style: defaultactionSheetTextStyle),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              //Todo: Navigate to 복약정보 수정
              Navigator.pop(context);
            },
            child: const Text('복약 정보 수정하기', style: defaultactionSheetTextStyle),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => MedicationInfoDelete()));
            },
            child: const Text('복약 정보 삭제하기', style: defaultactionSheetTextStyle),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('취소', style: cancelSheetTextStyle)),
      ),
    );
  }
  
}
