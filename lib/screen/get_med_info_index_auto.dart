import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/model/medication.dart';
import '../components/component.dart';
import 'package:flutter_application/constants/colors.dart';

import '../components/decorations.dart';
import '../components/textstyle.dart';
import '../widget/medTimeBeAfNonChanged.dart';
import '../widget/medTimeNonChanged.dart';

import 'package:intl/intl.dart';

class GetMedInfoIndexAuto extends StatefulWidget {
  const GetMedInfoIndexAuto({Key? key}) : super(key: key);

  @override
  _GetMedInfoIndexAutoState createState() => _GetMedInfoIndexAutoState();
}

class _GetMedInfoIndexAutoState extends State<GetMedInfoIndexAuto> {
  @override
  Widget build(BuildContext context) {
    return safeAreaPage(
      Colors.white,
      Colors.white,
      Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(children: <Widget>[
              MedInfoIndexAuto(),
            ]),
          )),
    );
  }
}

class MedInfoIndexAuto extends StatefulWidget {
  const MedInfoIndexAuto({Key? key}) : super(key: key);

  @override
  _MedInfoIndexAutoState createState() => _MedInfoIndexAutoState();
}

class _MedInfoIndexAutoState extends State<MedInfoIndexAuto> {
  Medication medication = Medication(
      "끓는 인간은 같은 위하여",
      null,
      2,
      "2023-08-10",
      "2023-08-15",
      "LUNCH",
      "AFTER",
      5,
      "11:05:12",
      '''끓는 인간은 같은 위하여, 청춘에서만 석가는 전인 우리 있는가? 소리다.이것은 힘차게 소담스러운 스며들어 돋고, 이상 때문이다. 몸이 사랑의 심장의 실현에 것이다. 앞이 돋고, 쓸쓸한 온갖 피어나기 이것은 불러 그것은 피다. 역사를 피가 청춘의 스며들어 남는 운다. 능히 목숨을 그것은 뜨거운지라, 말이다. 공자는 영원히 트고, 피가 끓는다. 영원히 청춘에서만 그들의 작고 대중을 열매를 인생에 어디 황금시대다. 못할 품으며, 같은 약동하다. 피가 구하기 역사를 설산에서 뿐이다. 어디 목숨을 있는 것은 같은 굳세게 찬미를 꽃 대한 피다.

없으면, 사랑의 보이는 그들은 속잎나고, 귀는 물방아 이것이다. 미인을 하는 이상이 대중을 운다. 청춘의 풀밭에 현저하게 그러므로 청춘 트고, 안고, 있는가? 같은 있는 청춘 예가 살 아름다우냐? 심장의 설산에서 열락의 인생을 인생에 있으랴? 가는 위하여 인생을 위하여서, 얼마나 생의 것이다. 풍부하게 장식하는 위하여 밝은 산야에 생생하며, 사막이다. 수 눈에 낙원을 황금시대를 운다. 것이다.보라, 광야에서 끓는 피부가 그들의 이상이 미묘한 사막이다. 꽃이 할지니, 미인을 맺어, 피가 남는 방황하여도, 속에서 때문이다.

얼마나 피가 소금이라 얼마나 이 운다. 하여도 너의 얼음과 목숨이 이는 위하여서 길을 것이다. 앞이 그들을 되는 있는가? 인생을 평화스러운 보배를 인간은 듣는다. 희망의 투명하되 생의 원질이 끓는 구하지 들어 있으랴? 따뜻한 청춘 만물은 들어 착목한는 그러므로 약동하다. 사는가 듣기만 이 풍부하게 청춘은 약동하다. 생명을 그들은 우리의 풍부하게 이 돋고, 이것이야말로 그리하였는가? 보이는 맺어, 가는 그들의 공자는 천고에 뜨거운지라, 위하여서. 그러므로 주는 모래뿐일 얼마나 인류의 황금시대의 아름다우냐?''');

  @override
  Widget build(BuildContext context) {
    return safeAreaPage(
      Colors.white,
      Colors.white,
      Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            defaultHeader(
              '복약 정보 조회하기',
              context,
              Center(
                child: CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    _showActionSheet(context);
                  },
                  child: Icon(
                    CupertinoIcons.ellipsis_vertical,
                    color: Colors.black.withOpacity(0.9),
                    size: 28,
                  ),
                ),
              ),
            ),
            //** 약 이미지
            Container(
              padding: const EdgeInsets.only(top: 18.0),
              child: CircleAvatar(
                backgroundColor: main_color_green,
                radius: 40,
                child: medication.medicineImage == null
                    ? const Text("💊")
                    : CircleAvatar(
                        backgroundImage: AssetImage(medication.medicineImage!),
                        radius: 38,
                      ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //** 약 이름
                    Container(
                      padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                      height: 40,
                      child: Center(
                        child: Text(medication.medicineName),
                      ),
                    ),
                    SizedBox(width: 12),
                    //** 1회 복용량
                    Container(
                      width: 70,
                      height: 40,
                      decoration: medInfoIndexDecoration(),
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Center(
                          child: Text(
                        "${medication.takeCapacity}정",
                      )),
                    ),
                  ],
                )),
            //** 복용 기간
            Container(
                padding: EdgeInsets.fromLTRB(45, 27, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text('복용 기간',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ))),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //** 복용 시작일
              Container(
                padding: const EdgeInsets.only(top: 9),
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: medInfoIndexDecoration(),
                  child: Center(
                    child: Text(
                      formatDate(medication.takeStartDate),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Text('~',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              SizedBox(width: 5),
              //** 복용 종료일
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: medInfoIndexDecoration(),
                  child: Center(
                    child: Text(
                      formatDate(medication.takeEndDate),
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(height: 15),
            //** 복약 시간
            Container(
                padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text('복약 시간',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ))),
            SizedBox(height: 7),
            //** 복약 시간 - 아침, 점심, 저녁
            Container(
              alignment: Alignment.center,
              child: IgnorePointer(
                  ignoring: true,
                  child: MedTimeNotChangedWidget(
                      selectedSegment: medication.takeMealTime)),
            ),
            SizedBox(height: 7),
            //** 복약 시간 - 식후, 식전
            Container(
              alignment: Alignment.center,
              child: IgnorePointer(
                  ignoring: true,
                  child: MedTimeBeAfNotChangedWidget(
                      selectedSegment: medication.takeBeforeAfter)),
            ),
            SizedBox(
              height: 15,
            ),
            // 복약 주기
            Container(
                padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                alignment: Alignment.centerLeft,
                child: Text('복약 주기',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ))),
            SizedBox(height: 10),

            Container(
                width: 330,
                height: 40,
                decoration: medInfoIndexDecoration(),
                padding: EdgeInsets.fromLTRB(13, 9, 8, 9),
                child: Center(
                  child: Text(
                    "7일",
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            // 복약 알림
            medication.notificationTime != null
                ? Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(45, 0, 10, 0),
                              alignment: Alignment.centerLeft,
                              child: Text('복약 알림',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ))),
                          IgnorePointer(
                            ignoring: true,
                            child: CupertinoSwitch(
                              value: true,
                              activeColor: CupertinoColors.activeGreen,
                              onChanged: (bool? value) {},
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                          decoration: medInfoIndexDecoration(),
                          width: 330,
                          height: 50,
                          child: Center(
                            child: Text(
                              formatTime(medication.notificationTime!),
                            ),
                          )),
                      SizedBox(
                        height: 13,
                      ),
                    ],
                  )
                : SizedBox(),

            Container(
                padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text('설명',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ))),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(top: 6.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                width: 324,
                decoration: medInfoIndexDecoration(),
                child: Text(medication.description!),
              ),
            ),
            // 여유 공간
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  String formatDate(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);

    String formattedDate = DateFormat.yMMMMd('ko_KR').format(dateTime);

    return formattedDate;
  }

  String formatTime(String inputTime) {
    DateTime dateTime = DateFormat("HH:mm:ss").parse(inputTime);

    String formattedTime = DateFormat.jm('ko_KR').format(dateTime);

    return formattedTime;
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              //Todo: Navigate to 복약정보 수정
              Navigator.pop(context);
            },
            child: const Text('복약 정보 수정하기', style: defaultactionSheetTextStyle),
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
