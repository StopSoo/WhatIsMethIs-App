import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/controller/medication_controller.dart';
import 'package:flutter_application/model/medication.dart';
import 'package:flutter_application/screen/get_med_info_index_auto.dart';
import '../components/component.dart';
import 'package:flutter_application/constants/colors.dart';

import '../components/decorations.dart';
import '../components/textstyle.dart';
import '../widget/medTimeBeAfNonChanged.dart';
import '../widget/medTimeNonChanged.dart';
import 'package:flutter_application/widget/datePickerWidget.dart';
import 'package:flutter_application/widget/timePickerWidget.dart';
import 'package:flutter_application/widget/medCountWidget.dart';
import 'package:flutter_application/widget/medCycleWidget.dart';

import 'package:intl/intl.dart';

class EditMedInfoIndexManual extends StatefulWidget {
  final int medicationId;
  const EditMedInfoIndexManual({Key? key, required this.medicationId})
      : super(key: key);

  @override
  _EditMedInfoIndexManualState createState() => _EditMedInfoIndexManualState();
}

class _EditMedInfoIndexManualState extends State<EditMedInfoIndexManual> {
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
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Column(children: <Widget>[
                EditMedManual(medicationId: widget.medicationId),
              ]),
            )),
      ),
    );
  }
}

class EditMedManual extends StatefulWidget {
  final int medicationId;

  const EditMedManual({super.key, required this.medicationId});

  @override
  _EditMedManualState createState() => _EditMedManualState();
}

class _EditMedManualState extends State<EditMedManual> {
  final MedicationController _medicationController = MedicationController();
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;

  late bool _isChecked; // 복약 알림 - switch
  Medication _medication = Medication(
      null, null, null, null, null, null, null, null, null, null, null, null);
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
      _isChecked = medication.notificationTime != null;

      _nameController =
          TextEditingController(text: medication.medicineName ?? '');
      _descriptionController =
          TextEditingController(text: medication.description ?? '');
    });
  }

  Future<void> _editMedicationInfo(
      int medicationId, Medication _medication) async {
    await _medicationController.editMedicationInfoIndex(
        medicationId, _medication);
  }

  @override
  Widget build(BuildContext context) {
    return _medication.medicineName == null
        ? const Center(child: CupertinoActivityIndicator())
        : Container(
            decoration: const BoxDecoration(color: white),
            child: Column(
              children: <Widget>[
                defaultHeader(
                    '복약 정보 수정하기',
                    context,
                    Center(
                      child: CupertinoButton(
                        minSize: 0,
                        padding: const EdgeInsets.all(0),
                        onPressed: () async {
                          setState(() {
                            _medication.description =
                                _descriptionController.text;
                          });
                          // 수정 API 호출
                          await _editMedicationInfo(
                              widget.medicationId, _medication);

                          //TODO: pushNamedAndRemoveUntil로 변경하기
                          //수정하는 페이지와 팝업으로 뒤로 가기 안되게 일단 pop...
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);

                          // 수정된 복약 정보 페이지로 이동
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => GetMedInfoIndexAuto(
                                        medicationId: widget.medicationId,
                                      )));
                        },
                        child: Center(
                          child: Text(
                            "완료",
                            style: greenTextStyle(15.0),
                          ),
                        ),
                      ),
                    )),
                //** 약 이미지
                CupertinoButton(
                  minSize: 0,
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    //TODO: 클릭하면 이미지 수정할 수 있게 변경
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: CircleAvatar(
                      backgroundColor: main_color_green,
                      radius: 40,
                      child: _medication.medicineImage == null
                          ? const Icon(
                              CupertinoIcons.photo_on_rectangle,
                              size: 28,
                              color: dark_green,
                            )
                          : CircleAvatar(
                              backgroundImage:
                                  NetworkImage(_medication.medicineImage!),
                              radius: 38,
                            ),
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 168,
                          height: 40,
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          decoration: medInfoIndexDecoration(),
                          child: TextField(
                            controller: _nameController,
                            style:
                                const TextStyle(color: dark_gray, fontSize: 16),
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                                hintText: '약 이름',
                                hintStyle:
                                    TextStyle(color: dark_gray, fontSize: 16),
                                border: InputBorder.none, // 텍스트 박스 아래 줄 제거
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        MedCountPickerWidget(
                          selectedCount: (_medication.takeCapacity! - 1),
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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DatePickerWidget(
                            selectedDate:
                                string2Date(_medication.takeStartDate!),
                            onDateChanged: (newDate) {
                              setState(() {
                                _medication.takeStartDate =
                                    date2String(newDate);
                              });
                            }),
                        const SizedBox(width: 2),
                        const Text('~',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700)),
                        const SizedBox(width: 2),
                        DatePickerWidget(
                            selectedDate: string2Date(_medication.takeEndDate!),
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
                    selectedSegment: _medication.takeMealTime!,
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
                    selectedSegment: _medication.takeBeforeAfter!,
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
                  selectedCycle: _medication.takeCycle! - 1,
                  onMedCycleChanged: (newCycle) {
                    setState(() {
                      _medication.takeCycle = newCycle;
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
                DatePickerExample(
                  time: _medication.notificationTime == null
                      ? DateTime.now()
                      : string2Time(_medication.notificationTime!),
                  onTimePickerChanged: (newTime) {
                    setState(() {
                      _medication.notificationTime = time2String(newTime);
                    });
                  },
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
                        controller: _descriptionController,
                        style: const TextStyle(color: dark_gray, fontSize: 16),
                        scrollPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        keyboardType: TextInputType.multiline,
                        maxLines: null, // 자동 줄바꿈
                        decoration: const InputDecoration(
                            hintText: '약에 대한 설명을 입력하세요.',
                            border: InputBorder.none, // 텍스트 박스 아래 줄 제거
                            labelStyle: TextStyle(color: dark_gray),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    )),
              ],
            ),
          );
  }

  DateTime string2Date(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);

    return dateTime;
  }

  String date2String(DateTime dateTime) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

    return formattedDate;
  }

  String time2String(DateTime dateTime) {
    String formattedTime = DateFormat("HH:mm:ss").format(dateTime);

    return formattedTime;
  }

  DateTime string2Time(String inputTime) {
    //더미 날짜
    String dummyDate = "2023-09-03";
    DateTime dateTime = DateTime.parse("$dummyDate $inputTime");

    return dateTime;
  }
}
