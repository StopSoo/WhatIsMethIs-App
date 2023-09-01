import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constants/colors.dart';

import '../components/component.dart';
import '../components/textstyle.dart';
import '../controller/medication_controller.dart';
import '../model/medication.dart';
import 'medication_info.dart';

Map<String, String> mealTime = {
  "BREAKFAST": "아침",
  "LUNCH": "점심",
  "DINNER": "저녁",
};

Map<String, String> beforeAfterTime = {
  "BEFORE": "식전",
  "AFTER": "식후",
};

class MedicationInfoDelete extends StatefulWidget {
  const MedicationInfoDelete({Key? key}) : super(key: key);

  @override
  _MedicationInfoDeleteState createState() => _MedicationInfoDeleteState();
}

class _MedicationInfoDeleteState extends State<MedicationInfoDelete> {
  final MedicationController _medicationController = MedicationController();

  int _page = 0;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  late ScrollController _scrollController;
  List<Medication> _medInfoList = [];
  List<bool> _isChecked = [];

  //삭제할 인덱스 리스트
  List<int> medicationIds = [];

  @override
  void initState() {
    super.initState();
    _loadInitMedicationInfoList();
    _scrollController = ScrollController()
      ..addListener(_loadMoreMedicationInfoList);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_loadMoreMedicationInfoList);
    super.dispose();
  }

  Future<void> _loadInitMedicationInfoList() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    print("page: ${_page}");

    List<Medication> medInfos =
        await _medicationController.fetchMedicationInfo(_page);
    setState(() {
      _medInfoList.addAll(medInfos);
      _isChecked.addAll(List<bool>.filled(medInfos.length, false));
      _isFirstLoadRunning = false;
    });
  }

  Future<void> _loadMoreMedicationInfoList() async {
    if (_hasNextPage &&
        !_isFirstLoadRunning &&
        !_isLoadMoreRunning &&
        _scrollController.position.extentAfter < 100) {
      setState(() {
        _isLoadMoreRunning = true;
        _page += 1;
      });

      print("page: ${_page}");
      List<Medication> medInfos =
          await _medicationController.fetchMedicationInfo(_page);

      if (medInfos.isNotEmpty) {
        setState(() {
          _medInfoList.addAll(medInfos);
          _isChecked.addAll(List<bool>.filled(medInfos.length, false));
        });
      } else {
        //더이상 데이터 X
        setState(() {
          _hasNextPage = false;
        });
      }
      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return safeAreaPage(
      Colors.white,
      Colors.white,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          defaultHeader(
              "복약 정보 삭제하기",
              context,
              CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.all(0),
                onPressed: () async {
                  //delete
                  await _medicationController
                      .deleteMedicationInfo(medicationIds);
                  (medicationIds);

                  //TODO: 페이지 스택 관리
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => MedicationInfo()));
                },
                child: Icon(
                  CupertinoIcons.trash,
                  color: Colors.black.withOpacity(0.9),
                  size: 28,
                ),
              )),
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: _medInfoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return medicationDeleteRow(index);
                }),
          ),
          if (_isLoadMoreRunning == true)
            Container(
              padding: const EdgeInsets.all(30),
              child: const Center(
                child: CupertinoActivityIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  GestureDetector medicationDeleteRow(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked[index] = !_isChecked[index];
          if (_isChecked[index]) {
            medicationIds.add(_medInfoList[index].medicationId!);
          } else {
            medicationIds.remove(_medInfoList[index].medicationId!);
          }
        });
        print(index);
        print(_isChecked[index]);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CupertinoCheckbox(
            onChanged: null,
            value: _isChecked[index],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            activeColor: more_green,
            inactiveColor: more_green,
          ),
          medicationShortInfoBox(
              _medInfoList[index].medicineImage,
              mealTime[_medInfoList[index].takeMealTime]!,
              beforeAfterTime[_medInfoList[index].takeBeforeAfter]!,
              _medInfoList[index].medicineName ?? '',
              _medInfoList[index].takeCapacity ?? 0),
        ],
      ),
    );
  }

  Padding medicationShortInfoBox(
      String? image, String lunch, String after, String itemName, int cnt) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // * Left Image
          Container(
            margin: const EdgeInsets.only(right: 25),
            child: CircleAvatar(
              backgroundColor: main_color_green,
              radius: 40,
              child: image == null
                  ? const Text("💊")
                  : CircleAvatar(
                      backgroundImage: NetworkImage(image),
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
                  Text(
                    itemName,
                    style: darkGrayTextStyle(15),
                    softWrap: true,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "${cnt}정",
                    style: darkGrayTextStyle(15),
                    softWrap: true,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
