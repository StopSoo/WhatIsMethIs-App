import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/controller/medication_controller.dart';
import 'package:flutter_application/model/medication.dart';
import 'package:flutter_application/screen/edit_med_info_index_auto.dart';
import '../components/component.dart';
import 'package:flutter_application/constants/colors.dart';

import '../components/decorations.dart';
import '../components/textstyle.dart';
import '../widget/medTimeBeAfNonChanged.dart';
import '../widget/medTimeNonChanged.dart';

import 'package:intl/intl.dart';

class GetMedInfoIndexAuto extends StatefulWidget {
  final int medicationId;
  const GetMedInfoIndexAuto({Key? key, required this.medicationId}) : super(key: key);

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
              MedInfoIndexAuto(medicationId: widget.medicationId),
            ]),
          )),
    );
  }
}

class MedInfoIndexAuto extends StatefulWidget {
  final int medicationId;
  const MedInfoIndexAuto({Key? key, required this.medicationId}) : super(key: key);

  @override
  _MedInfoIndexAutoState createState() => _MedInfoIndexAutoState();
}

class _MedInfoIndexAutoState extends State<MedInfoIndexAuto> {
  final MedicationController _medicationController = MedicationController();
  

    Medication _medication = Medication(null, null, null, null, null, null, null, null, null, null, null, null);

@override
  void initState() {
    super.initState();
    _loadMedicationInfo(widget.medicationId);
  }

  Future<void> _loadMedicationInfo(int medicationId) async {
    Medication medication = 
        await _medicationController.fetchMedicationInfoIndex(medicationId);
    setState(() {
      _medication = medication;
    });
  }

  @override
  Widget build(BuildContext context) {
    return safeAreaPage(
      Colors.white,
      Colors.white,
      _medication.medicineName == null
              ? Center(child: CupertinoActivityIndicator())
              : 
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
                child: _medication.medicineImage == null
                    ? const Text("💊")
                    : CircleAvatar(
                        backgroundImage: NetworkImage(_medication.medicineImage!),
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
                        child: Text(_medication.medicineName ?? ''),
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
                        "${_medication.takeCapacity}정",
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
                      formatDate(_medication.takeStartDate  ?? ''),
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
                      formatDate(_medication.takeEndDate  ?? ''),
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
                      selectedSegment: _medication.takeMealTime  ?? '')),
            ),
            SizedBox(height: 7),
            //** 복약 시간 - 식후, 식전
            Container(
              alignment: Alignment.center,
              child: IgnorePointer(
                  ignoring: true,
                  child: MedTimeBeAfNotChangedWidget(
                      selectedSegment: _medication.takeBeforeAfter  ?? '')),
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
            _medication.notificationTime != null
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
                              formatTime(_medication.notificationTime!),
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
                child: Text(_medication.description!),
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
              Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                EditMedInfoIndexAuto(medicationId: widget.medicationId,)));

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
