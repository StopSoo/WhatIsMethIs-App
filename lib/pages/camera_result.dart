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
  /*
   e약은요 API 기준 명명
  */
  String itemName = "닥터베아제정";
  String entpName = "(주)대웅제약";
  String efcyQesitm = ''' 이 약은 소화불량, 식욕감퇴(식욕부진), 과식, 체함, 소화촉진, 소화불량으로 인한 위부팽만감에 사용합니다.''';
  String useMethodQesitm = "성인 1회 1정을 1일 3회 식후에 복용합니다.";
  String atpnWarnQesitm =  "";
  String atpnQesitm = '''만 7세 이하의 소아는 이 약을 복용하지 마십시오.
이 약을 복용하기 전에 알레르기 체질인 사람, 임부 또는 임신하고 있을 가능성이 있는 여성, 이 약 또는 황색4호에 과민증 환자는 의사 또는 약사와 상담하십시오.
정해진 용법과 용량을 잘 지키십시오.
2주 정도 복용하여도 증상의 개선이 없을 경우 즉각 복용을 중지하고 의사 또는 약사와 상담하십시오.''';
  String intrcQesitm = "";
  String seQesitm = "";
  String depositMethodQesitm = '''습기와 빛을 피해 실온에서 보관하십시오.
어린이의 손이 닿지 않는 곳에 보관하십시오.''';

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
            resultHeader("식별 결과 보기", context),
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
            const Divider(
              thickness: 1,
              height: 1,
              color: lightGrayColor,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: roundFitWidthImage(width, 'assets/image/test_cat.jpg'),
            ),
            pillDetailBox("제품명", itemName),
            pillDetailBox("업체명", entpName),
            pillDetailBox("효능", efcyQesitm),
            pillDetailBox("사용법", useMethodQesitm),
            pillDetailBox("주의사항경고", atpnWarnQesitm),
            pillDetailBox("주의사항", atpnQesitm),
            pillDetailBox("상호작용", intrcQesitm),
            pillDetailBox("부작용", seQesitm),
            pillDetailBox("보관법", depositMethodQesitm),
            
          ],
        ),
      ),
    );
  }

  Padding pillDetailBox(String title, String content) {
    if(content.isEmpty){
      return Padding(padding: EdgeInsets.zero);
    }

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
