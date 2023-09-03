import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/controller/medicine_controller.dart';
import 'package:flutter_application/model/medicine.dart';
import 'package:flutter_application/screen/name_result.dart';

import '../components/component.dart';
import '../components/textstyle.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController textController = TextEditingController();
  FocusNode focusNode = FocusNode();

  final MedicineController _medicineController = MedicineController();
  int _page = 1;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  late ScrollController _scrollController;
  List<Medicine> medcineList = [];

  @override
  void initState() {
    super.initState();
    _loadInitMedicineList();
    _scrollController = ScrollController()..addListener(_loadMoreMedicineList);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_loadMoreMedicineList);
    super.dispose();
  }

  Future<void> _loadInitMedicineList() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    print("page: $_page");

    List<Medicine> medInfos = await _medicineController.fetchAllMedicineListInfo(_page);
    setState(() {
      medcineList.addAll(medInfos);
      _isFirstLoadRunning = false;
    });
  }

  Future<void> _loadMoreMedicineList() async {
    if (_hasNextPage && !_isFirstLoadRunning && !_isLoadMoreRunning && _scrollController.position.extentAfter < 100) {
      setState(() {
        _isLoadMoreRunning = true;
        _page += 1;
      });

      print("page: $_page");
      List<Medicine> medInfos = await _medicineController.fetchAllMedicineListInfo(_page);

      if (medInfos.isNotEmpty) {
        setState(() {
          medcineList.addAll(medInfos);
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

  Future<void> _loadMedicineListWithName(String itemName) async {
    List<Medicine> medInfos = await _medicineController.fetchMedicineListInfoWithName(itemName);
    setState(() {
      medcineList = [];
      medcineList.addAll(medInfos);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return safeAreaPage(
      Colors.white,
      Colors.white,
      Column(
        children: [
          searchHeader(),
          Expanded(
            child: ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    pillInfoBox(width, medcineList[index].itemSeq!, medcineList[index].itemName, medcineList[index].itemImage),
                separatorBuilder: (BuildContext context, int index) => const Divider(
                      height: 1,
                      color: bright_gray,
                    ),
                itemCount: medcineList.length),
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

  Widget searchHeader([double height = 60.0]) {
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
                  CupertinoIcons.chevron_back,
                  color: more_green,
                  size: 30,
                ),
              ),
            ),
            // * Center SearchField
            Expanded(
                child: Center(
              child: CupertinoSearchTextField(
                placeholder: "약 이름을 검색하세요",
                focusNode: focusNode,
                controller: textController,
                style: darkGrayTextStyle(15),
                onSubmitted: (value) async => {
                  //TODO: 잘못 검색했을 시 화면 처리
                  await _loadMedicineListWithName(value),
                },
              ),
            )),
            // * Right Button
            focusNode.hasFocus
                ? Center(
                    child: CupertinoButton(
                      padding: const EdgeInsets.only(left: 8.0),
                      onPressed: () {
                        setState(() {
                          focusNode.unfocus();
                          textController.clear();
                        });
                      },
                      child: Text("취소", style: blueTextStyle(17)),
                    ),
                  )
                : Expanded(
                    flex: 0,
                    child: Container(),
                  ),
          ],
        ),
      ),
    );
  }

  CupertinoButton pillInfoBox(double width, String itemSeq, String? pillName, String? image) {
    return CupertinoButton(
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => NameResult(
              itemSeq: itemSeq,
            ),
          ),
        );
      },
      child: Container(
        color: Colors.white,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
            roundFitWidthImage_Small(width, image),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                pillName ?? '',
                style: darkGrayTextStyle(15),
                softWrap: true,
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget roundFitWidthImage_Small(double width, String? image) {
    return image == null
        ? Container(
            width: width * (0.30),
            height: width * (0.15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: main_color_green,
            ),
            child: Center(child: Text("💊")))
        : Image.network(
            image,
            width: width * (0.30),
            height: 80,
            fit: BoxFit.fitWidth,
          );
  }
}
