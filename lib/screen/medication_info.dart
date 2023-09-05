import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/controller/medication_controller.dart';
import 'package:flutter_application/model/medication.dart';
import 'package:flutter_application/screen/get_med_info_index_auto.dart';
import 'package:flutter_application/screen/medication_info_delete.dart';

import '../components/component.dart';
import '../components/textstyle.dart';

import 'get_med_info_index_manual.dart';
import 'registerMedInfoManual.dart';

Map<String, String> mealTime = {
  "BREAKFAST": "아침",
  "LUNCH": "점심",
  "DINNER": "저녁",
};

Map<String, String> beforeAfterTime = {
  "BEFORE": "식전",
  "AFTER": "식후",
};

class MedicationInfo extends StatefulWidget {
  const MedicationInfo({Key? key}) : super(key: key);

  @override
  _MedicationInfoState createState() => _MedicationInfoState();
}

class _MedicationInfoState extends State<MedicationInfo> {
  final MedicationController _medicationController = MedicationController();

  int _page = 0;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  late ScrollController _scrollController;
  List<Medication> _medInfoList = [];

  //rebuild 확인용 변수
  bool _shouldRebuild = false;

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
    //되돌아왔을 때 화면 rebuild
    if (_shouldRebuild) {
      _shouldRebuild = false;
      _page = 0;
      _hasNextPage = true;
      _isFirstLoadRunning = false;
      _isLoadMoreRunning = false;
      _medInfoList = [];
      // 복약 정보 리스트 다시 받기
      _loadInitMedicationInfoList();
    }
    return safeAreaPage(
      Colors.white,
      Colors.white,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          defaultHeader(
            "복약 정보 조회하기",
            context,
            CupertinoButton(
              minSize: 0,
              padding: const EdgeInsets.all(0),
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
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: _medInfoList.length,
                itemBuilder: (BuildContext context, int index) =>
                    medicationShortInfoBox(
                        _medInfoList[index].medicineId!,
                        _medInfoList[index].medicationId!,
                        _medInfoList[index].medicineImage,
                        mealTime[_medInfoList[index].takeMealTime]!,
                        beforeAfterTime[_medInfoList[index].takeBeforeAfter]!,
                        _medInfoList[index].medicineName ?? '',
                        _medInfoList[index].takeCapacity ?? 0)),
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

  Widget medicationShortInfoBox(String medicineId, int medicationId,
      String? image, String lunch, String after, String itemName, int cnt) {
    dynamic result;
    return CupertinoButton(
      onPressed: () async {
        if (medicineId == "0") {
          result = await Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => GetMedInfoIndexManual(
                        medicationId: medicationId,
                      )));
        } else {
          result = await Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => GetMedInfoIndexAuto(
                        medicationId: medicationId,
                      )));
        }
        if (result != null && result == true) {
          setState(() {
            _shouldRebuild = true;
          });
        }
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
                    itemName.length > 15
                        ? '${itemName.substring(0, 15)}...'
                        : itemName, // Row 오버플로우 방지
                    style: darkGrayTextStyle(15),
                    softWrap: true,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "$cnt정",
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

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          //복약 정보 등록하기
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => RegisterMedPageManual()));
            },
            child: const Text('복약 정보 등록하기', style: defaultactionSheetTextStyle),
          ),
          //복약 정보 삭제하기
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const MedicationInfoDelete()));
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
