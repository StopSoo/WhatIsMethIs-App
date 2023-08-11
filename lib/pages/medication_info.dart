import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return safeAreaPage(
      Colors.white,
      Colors.white,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          medicationInfoHeader("복약 정보 조회하기", context),
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

  Padding pillShortInfoBox(
      String image, String lunch, String after, String itemName, int cnt) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // * Left Image
          CircleAvatar(
            backgroundColor: mainColor,
            radius: 40,
            child: image.isEmpty
                ? const Text("💊")
                : CircleAvatar(
                    backgroundImage: AssetImage(image),
                    radius: 38,
                  ),
          ),
          // * Right Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lunch + after,
                style: blackTextStyle_Bold(16),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    itemName,
                    style: darkGrayTextStyle(15),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "${cnt}정",
                    style: darkGrayTextStyle(15),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget medicationInfoHeader(String centerText, BuildContext context,
      [double height = 50.0]) {
    return Container(
      color: Colors.white,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // * Left Icon
            Center(
              child: CupertinoButton(
                minSize: 0,
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: greenColor,
                  size: 30,
                ),
              ),
            ),
            // * Center Text
            Center(
              child: Text(
                centerText,
                style: blackTextStyle_Bold(17),
              ),
            ),
            // * Right Icon
            Center(
              child: CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.all(0),
                onPressed: () {},
                child: Icon(
                  CupertinoIcons.ellipsis,
                  color: Colors.black.withOpacity(0.9),
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  
}
