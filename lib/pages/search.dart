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
  FocusNode focusNode = FocusNode();
  String searchText = "";
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
    'assets/image/test_cat.jpg',
    'assets/image/test_cat.jpg',
    'assets/image/test_cat.jpg',
    'assets/image/test_cat.jpg',
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
        children: [
          searchHeader(),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    pillInfoBox(width, pillNames[index], images[index]),
                separatorBuilder: (BuildContext context, int index) => Divider(
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
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black.withOpacity(0.9),
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
                style: darkGrayTextStyle(15),
              ),
            )),
            // * Right Button
            focusNode.hasFocus
                ? Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          searchText = "";
                          focusNode.unfocus();
                        });
                      },
                      child: Text("취소"),
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
              roundFitWidthImage(width, image),
              SizedBox(
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

  Container roundFitWidthImage(double width, String image) {
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
