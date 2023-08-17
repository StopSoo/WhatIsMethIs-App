import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/colors.dart';
import '../components/component.dart';
import '../components/textstyle.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  List<String> pillNames = [
    "타이레놀6시간이알서방정",
    "타이레놀8시간이알서방정",
    "타이레놀12시간이알서방정",
    "타이레놀6시간이알서방정",
    "타이레놀8시간이알서방정",
    "타이레놀12시간이알서방정",
    "타이레놀6시간이알서방정",
    "타이레놀8시간이알서방정",
    "타이레놀12시간이알서방정"
  ];
  List<String> images = [
    'assets/images/test_cat.jpg',
    'assets/images/test_cat.jpg',
    'assets/images/test_cat.jpg',
    'assets/images/test_cat.jpg',
    'assets/images/test_cat.jpg',
    'assets/images/test_cat.jpg',
    'assets/images/test_cat.jpg',
    'assets/images/test_cat.jpg',
    'assets/images/test_cat.jpg'
  ];

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
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    pillInfoBox(width, pillNames[index], images[index]),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                      height: 1,
                      color: lightGrayColor,
                    ),
                itemCount: pillNames.length),
          )
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
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  CupertinoIcons.chevron_back,
                  color: greenColor,
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
                controller: controller,
                style: darkGrayTextStyle(15),
                onSubmitted: (value) => {
                  //Todo: call searchAPI
                  controller.clear()
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
                          controller.clear();
                        });
                      },
                      child: Text("취소", style: blueTextStyle(17)),
                    ),
                  )
                : Expanded(
                    child: Container(),
                    flex: 0,
                  ),
          ],
        ),
      ),
    );
  }

  Container pillInfoBox(double width, String pillName, String image) {
    return Container(
      color: Colors.white,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              roundFitWidthImage_Small(width, image),
              const SizedBox(
                width: 20,
              ),
              Text(
                pillName,
                style: darkGrayTextStyle(15),
                softWrap: true,
              )
            ]),
      ),
    );
  }

  Container roundFitWidthImage_Small(double width, String image) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: mainColor,
          )),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(
          image,
          width: width * (0.35),
          height: 80,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
