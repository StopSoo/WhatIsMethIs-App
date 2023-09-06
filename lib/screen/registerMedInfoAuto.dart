// 복약 정보 등록하기 : 자동
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/components/functions.dart';
import 'package:flutter_application/components/textstyle.dart';
import 'package:flutter_application/controller/medication_controller.dart';
import 'package:flutter_application/model/medication.dart';
import 'package:flutter_application/screen/medication_info.dart';
import 'package:flutter_application/widget/medTimeBeAfNonChanged.dart';
import 'package:flutter_application/widget/medTimeNonChanged.dart';
import '../components/component.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/widget/datePickerWidget.dart';
import 'package:flutter_application/widget/timePickerWidget.dart';
import 'package:flutter_application/widget/medCountWidget.dart';
import 'package:flutter_application/widget/medCycleWidget.dart';

class RegisterMedPageAuto extends StatefulWidget {
  final String medicineName;
  final String medicineId;
  final String? medicineImage;

  RegisterMedPageAuto(
      {super.key,
      required this.medicineName,
      required this.medicineId,
      required this.medicineImage});

  @override
  State<RegisterMedPageAuto> createState() => _RegisterMedPageAutoState();
}

class _RegisterMedPageAutoState extends State<RegisterMedPageAuto> {
  @override
  Widget build(BuildContext context) {
    return safeAreaPage(
      Colors.white,
      Colors.white,
      GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Column(children: <Widget>[
                RegisterMed(
                  medicineId: widget.medicineId,
                  medicineName: widget.medicineName,
                  medicineImage: widget.medicineImage,
                ),
              ]),
            )),
      ),
    );
  }
}

class RegisterMed extends StatefulWidget {
  final String medicineName;
  final String medicineId;
  final String? medicineImage;
  const RegisterMed(
      {super.key,
      required this.medicineName,
      required this.medicineId,
      this.medicineImage});

  @override
  _RegisterMedState createState() => _RegisterMedState();
}

class _RegisterMedState extends State<RegisterMed> {
  bool _isChecked = false; // 복약 알림 - switch
  MedicationController _medicationController = MedicationController();

  //기본값 적용
  Medication _medication = Medication(null, null, null, null, 1,
      date2String(DateTime.now()), date2String(DateTime.now()),
      "BREAKFAST",  "BEFORE",
      1,  null, null);

  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    // 초기화
    super.initState();
    _isChecked = _medication.notificationTime != null;
  }

  // 완료 버튼을 누를 때 실행되는 함수
  Future<void> _onCompleteButtonPressed() async {
    // ** 필수 정보 입력되지 않은 경우 팝업 표시 하고 종료 -> 추후 적용 예정
    // if (_medication.takeCapacity == null ||
    //     _medication.takeStartDate == null ||
    //     _medication.takeEndDate == null ||
    //     _medication.takeMealTime == null ||
    //     _medication.takeBeforeAfter == null ||
    //     _medication.takeCycle == null) {

    //   await showCupertinoDialog<void>(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return CupertinoAlertDialog(
    //         title: Text('복약 정보를 등록할 수 없어요😥'),
    //         content: Text(
    //             '복약 정보를 입력해주세요.\n*1회 복용량,\n*복용 기간,\n*복약 시간,\n*복약 주기는 필수값입니다.'),
    //         actions: <Widget>[
    //           CupertinoDialogAction(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: Text('확인'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    //   return; // 함수 종료
    // }

    setState(() {
      // _medication 설정
      _medication.medicineId = widget.medicineId;
      _medication.medicineName = widget.medicineName;
      _medication.medicineImage = widget.medicineImage;

      if (!_isChecked) {
        _medication.notificationTime = null;
      }
    });

    // 등록 API 호출
    await _medicationController.registerMedicationInfoIndex(_medication);

    // 수정된 복약 정보 페이지로 이동
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => MedicationInfo()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: white),
      child: Column(
        children: <Widget>[
          defaultHeader(
              '복약 정보 등록하기',
              context,
              Center(
                child: CupertinoButton(
                  minSize: 0,
                  padding: const EdgeInsets.all(0),
                  onPressed: _onCompleteButtonPressed,
                  child: Center(
                    child: Text(
                      "완료",
                      style: greenTextStyle(15.0),
                    ),
                  ),
                ),
              )),
          //** 약 이미지
          Container(
            padding: const EdgeInsets.only(top: 18.0),
            child: CircleAvatar(
              backgroundColor: main_color_green,
              radius: 40,
              child: widget.medicineImage == null
                  ? const Text("💊")
                  : CircleAvatar(
                      backgroundImage: NetworkImage(widget.medicineImage!),
                      radius: 38,
                    ),
            ),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Center(
                      child: Text(widget.medicineName,
                          style: const TextStyle(
                            fontSize: 15,
                          )),
                    ),
                  ),
                  const SizedBox(width: 12),
                  MedCountPickerWidget(
                    selectedCount: _medication.takeCapacity == null
                        ? 0
                        : (_medication.takeCapacity! - 1),
                    onCountChanged: (index) {
                      //사용자가 수정한 인덱스 값이라 +1
                      setState(() {
                        _medication.takeCapacity = index + 1;
                      });
                    },
                  )
                ],
              )),
          // 복용 기간
          Container(
              padding: const EdgeInsets.fromLTRB(45, 27, 0, 0),
              alignment: Alignment.centerLeft,
              child: const Text('복용 기간',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ))),
          Container(
            alignment: Alignment.center,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              DatePickerWidget(
                  selectedDate: _medication.takeStartDate == null
                      ? DateTime.now()
                      : string2Date(_medication.takeStartDate!),
                  onDateChanged: (newDate) {
                    setState(() {
                      _medication.takeStartDate = date2String(newDate);
                    });
                  }),
              const SizedBox(width: 2),
              const Text('~',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              const SizedBox(width: 2),
              DatePickerWidget(
                  selectedDate: _medication.takeEndDate == null
                      ? DateTime.now()
                      : string2Date(_medication.takeEndDate!),
                  onDateChanged: (newDate) {
                    setState(() {
                      _medication.takeEndDate = date2String(newDate);
                    });
                  }),
            ]),
          ),
          const SizedBox(height: 15),
          // 복약 시간
          Container(
              padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: const Text('복약 시간',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ))),
          const SizedBox(height: 7),
          Container(
            alignment: Alignment.center,
            child: MedTimeNotChangedWidget(
              selectedSegment: _medication.takeMealTime ?? "BREAKFAST",
              onMedTimeChanged: (newMedtime) {
                setState(() {
                  _medication.takeMealTime = newMedtime;
                });
              },
            ),
          ),
          const SizedBox(height: 7),
          Container(
            alignment: Alignment.center,
            child: MedTimeBeAfNotChangedWidget(
              selectedSegment: _medication.takeBeforeAfter ?? "BEFORE",
              onMedTimeChanged: (newMedtime) {
                setState(() {
                  _medication.takeBeforeAfter = newMedtime;
                });
              },
            ),
          ),
          const SizedBox(height: 15),
          // 복약 주기
          Container(
              padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: const Text('복약 주기',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ))),
          const SizedBox(height: 10),
          MedCyclePickerWidget(
            selectedCycle: _medication.takeCycle == null
                ? 0
                : (_medication.takeCycle! - 1),
            onMedCycleChanged: (newCycle) {
              setState(() {
                _medication.takeCycle = newCycle + 1;
              });
            },
          ),
          const SizedBox(height: 10),
          // 복약 알림
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(45, 0, 10, 0),
                  alignment: Alignment.centerLeft,
                  child: const Text('복약 알림',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ))),
              CupertinoSwitch(
                value: _isChecked,
                activeColor: CupertinoColors.activeGreen,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = !_isChecked;
                  });
                },
              )
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: DatePickerExample(
              time: _medication.notificationTime == null
                  ? DateTime.now()
                  : string2Time(_medication.notificationTime!),
              onTimePickerChanged: (newTime) {
                setState(() {
                  _medication.notificationTime = time2String(newTime);
                });
              }, isChecked: _isChecked,
            ),
          ),
          const SizedBox(height: 13),
          Container(
              padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: const Text('설명',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ))),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                width: 324,
                height: 219,
                decoration: BoxDecoration(
                    color: bright_gray,
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  onChanged: (text) {
                          setState(() {
                            _medication.description = text;
                          });
                        },
                  controller: _descriptionController,
                  scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  keyboardType: TextInputType.multiline,
                  maxLines: null, // 자동 줄바꿈
                  decoration: InputDecoration(
                      hintText: '약에 대한 설명을 입력하세요.',
                      border: InputBorder.none, // 텍스트 박스 아래 줄 제거
                      labelStyle: TextStyle(color: dark_gray),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              )),
          // 여유 공간
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
