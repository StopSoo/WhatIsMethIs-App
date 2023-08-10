import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/colors.dart';
import '../components/component.dart';
import '../components/textstyle.dart';

class CameraResult extends StatefulWidget {
  const CameraResult({Key? key}) : super(key: key);

  @override
  _CameraResultState createState() => _CameraResultState();
}

class _CameraResultState extends State<CameraResult> {
  String name = "타이레놀8시간이알서방정";
  String ingredientsAndContent = ''' 1정 중 - 속방층
Acetaminophen 아세트아미노펜 325mg
1정 중 - 서방층
Acetaminophen 아세트아미노펜 325mg''';
  String usageAndCapacity = ''' 12세 이상의 소아 및 성인: 매 8시간마다 2정씩 복용
24시간 동안 6정을 초과하지 말 것''';

  String info = ''' 충분한 물과 함께 투여하세요
정기적으로 술을 마시는 사람은 이 약 투여전 반드시 전문가와 상의하세요
황달 등 간기능 이상징후가 나타날 경우에는 전문가와 상의하세요''';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return safeAreaPage(
      Colors.white,
      Colors.white,
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cameraResultHeader("식별 결과 보기", context),
            CupertinoButton(
              minSize: 0,
              padding: EdgeInsets.all(16.0),
              onPressed: () {
                //Todo: navigate to camera
                print("click image");
              },
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  roundFitWidthBlurImage(width, 'assets/image/test_cat.jpg'),
                  Center(
                    child: Text(
                      "사진을 눌러 다시 찍기",
                      style: whiteTextStyle_Bold(16),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1, height: 1, color: lightGrayColor,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: roundFitWidthImage(width, 'assets/image/test_cat.jpg'),
            ),
            pillDetailBox("제품명", name),
            pillDetailBox("성분/함량", ingredientsAndContent),
            pillDetailBox("용법 · 용량", usageAndCapacity),
            pillDetailBox("복약 정보", info),
          ],
        ),
      ),
    );
  }

  Padding pillDetailBox(String title, String content) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle(15),
          ),
          Text(
            content,
            style: darkGrayTextStyle(15),
          )
        ],
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
          width: width,
          height: width * (0.5),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  ClipRRect roundFitWidthBlurImage(double width, String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Stack(
        children: [
          Image.asset(
            image,
            width: width,
            height: width * (0.5),
            fit: BoxFit.fitWidth,
          ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                width: width,
                height: 180,
                color: Colors.transparent,
              )),
        ],
      ),
    );
  }
}

Widget cameraResultHeader(String centerText, BuildContext context,
    [double height = 50.0]) {
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
          // * Center Text
          Center(
            child: Text(
              centerText,
              style: blackTextStyle_Bold(17),
            ),
          ),
          // * Right Icon
          Center(
            child: CupertinoButton(
              minSize: 0,
              padding: EdgeInsets.all(0),
              onPressed: () {
                //Todo: change the Icon
              },
              child: Icon(
                CupertinoIcons.rectangle_stack_badge_plus,
                color: Colors.black.withOpacity(0.9),
                size: 28,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
