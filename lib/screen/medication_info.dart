import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/screen/medication_info_delete.dart';
import 'package:flutter_application/dto/medication_info_list_res.dart';

import '../components/component.dart';
import '../components/textstyle.dart';

import 'package:flutter_application/dto/base_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../dto/medication_short_info.dart';
import 'registerMedInfoManual.dart';

class MedicationInfo extends StatefulWidget {
  const MedicationInfo({Key? key}) : super(key: key);

  @override
  _MedicationInfoState createState() => _MedicationInfoState();
}

class _MedicationInfoState extends State<MedicationInfo> {
  String baseUrl = dotenv.get("BASE_URL");

  //Todo: 로그인 구현되면 받아오는걸로 수정하기
  String accessToken = dotenv.get("ACCESS_TOKEN");

  late Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-ACCESS-TOKEN':
        accessToken
  };

  int _page = 0;
  late String _url = '${baseUrl}/medications/all/${_page}';
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  late ScrollController _controller;
  List<MedicationShortInfo> _medInfoList = [];

  @override
  void initState() {
    super.initState();
    fetchInfo();
    _controller = ScrollController()..addListener(fetchMoreInfo);
  }

  @override
  void dispose() {
    _controller.removeListener(fetchMoreInfo);
    super.dispose();
  }

  void fetchInfo() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    print("page: ${_page}");
    final response = await http.get(Uri.parse(_url), headers: headers);

    var statusCode = response.statusCode;
    var responseBody = utf8.decode(response.bodyBytes);
    // print("statusCode: ${statusCode}");
    // print("responseBody: ${responseBody}");
    Map responseMap = jsonDecode(responseBody);

    var BrmedicationInfo = BaseResponse.fromJSON(responseMap);
    // print("code: ${BrmedicationInfo.code}");
    // print("message: ${BrmedicationInfo.message}");
    // print("result: ${BrmedicationInfo.result}");

    MedicationInfoListRes medList =
        MedicationInfoListRes.fromJson(BrmedicationInfo.result);
    // print("totalPages: ${medList.totalPages}");
    setState(() {
      _medInfoList.addAll(medList.medicationShortInfos);
    });

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void fetchMoreInfo() async {
    if (_hasNextPage &&
        !_isFirstLoadRunning &&
        !_isLoadMoreRunning &&
        _controller.position.extentAfter < 100) {
          setState(() {
        _isLoadMoreRunning = true;
        _page += 1;
      });
      
      print("page: ${_page}");
      _url = '${baseUrl}/medications/all/${_page}';
      print("_url: ${_url}");
      final response = await http.get(Uri.parse(_url), headers: headers);

      var statusCode = response.statusCode;
      var responseBody = utf8.decode(response.bodyBytes);
      // print("statusCode: ${statusCode}");
      // print("responseBody: ${responseBody}");
      Map responseMap = jsonDecode(responseBody);

      var BrmedicationInfo = BaseResponse.fromJSON(responseMap);
      // print("code: ${BrmedicationInfo.code}");
      // print("message: ${BrmedicationInfo.message}");
      // print("result: ${BrmedicationInfo.result}");

      MedicationInfoListRes medList =
          MedicationInfoListRes.fromJson(BrmedicationInfo.result);

      if (medList.medicationShortInfos.isNotEmpty) {
        setState(() {
          _medInfoList.addAll(medList.medicationShortInfos);
        });
      } else {
        // This means there is no more data
        // and therefore, we will not send another GET request
        setState(() {
          _hasNextPage = false;
        });
      }
      // print("totalPages: ${medList.totalPages}");
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
            "복약 정보 조회하기",
            context,
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
                controller: _controller,
                shrinkWrap: true,
                itemCount: _medInfoList.length,
                itemBuilder: (BuildContext context, int index) =>
                    pillShortInfoBox(
                        _medInfoList[index].medicineImage,
                        _medInfoList[index].takeMealTime,
                        _medInfoList[index].takeBeforeAfter,
                        _medInfoList[index].medicineName,
                        _medInfoList[index].takeCapacity)),
          ),
          if (_isLoadMoreRunning == true)
            Container(
              padding: const EdgeInsets.all(30),
              child: const Center(
                child: CupertinoActivityIndicator(),
              ),
            ),
          if (_hasNextPage == false)
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blue,
              child: const Center(
                child: Text('No more data to be fetched.',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
        ],
      ),
    );
  }

  CupertinoButton pillShortInfoBox(
      String image, String lunch, String after, String itemName, int cnt) {
    if (lunch == "DINNER") {
      lunch = "저녁";
    } else if (lunch == "LUNCH") {
      lunch = "점심";
    } else if (lunch == "BREAKFAST") {
      lunch = "아침";
    }
    if (after == "AFTER") {
      after = "식후";
    } else if (after == "BEFORE") {
      after = "식전";
    }

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
              backgroundColor: main_color_green,
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
                      builder: (context) => RegisterMedPageManual(
                            title: '',
                          )));
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
                      builder: (context) => MedicationInfoDelete()));
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