// 알약 찾기 가로 스크롤 위젯 & 스크롤 바 구현
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FindMedWidget extends StatefulWidget {
  const FindMedWidget({super.key});

  @override
  _FindMedWidgetState createState() => _FindMedWidgetState();
}

class _FindMedWidgetState extends State<FindMedWidget> {
  var controller;
  @override
  void initState() {
    controller = PageController(
      viewportFraction: 0.8,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 400,
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CupertinoButton(
                        onPressed: () {},
                        minSize: 0,
                        padding: const EdgeInsets.all(0),
                        child: Stack(children: [
                          Container(
                            width: 217,
                            height: 268,
                            decoration: BoxDecoration(color: main_color_yellow, borderRadius: BorderRadius.circular(15)),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(26, 133, 98, 81),
                              child: const Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    '사진으로\n알약 찾기',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, fontFamily: 'Inter-ExtraBold', color: black),
                                  ))),
                          const SizedBox(width: 26),
                          Container(
                              margin: const EdgeInsets.fromLTRB(26, 53, 0, 0),
                              child: const Icon(
                                CupertinoIcons.photo_on_rectangle,
                                size: 28,
                                color: Color(0xFF9A9526),
                              )),
                          Container(
                              padding: const EdgeInsets.fromLTRB(28, 201, 32, 23),
                              child: const Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '알약을 카메라로 찍으면\n이름을 알려줘요',
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200, fontFamily: 'Inter-ExtraBold', color: black),
                                  )))
                        ])),
                    const SizedBox(width: 30),
                    CupertinoButton(
                        onPressed: () {},
                        minSize: 0,
                        padding: const EdgeInsets.all(0),
                        child: Stack(children: [
                          Container(
                            width: 217,
                            height: 268,
                            decoration: BoxDecoration(color: main_color_green, borderRadius: BorderRadius.circular(15)),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(26, 133, 98, 81),
                              child: const Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    '이름으로\n알약 찾기',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, fontFamily: 'Inter-ExtraBold', color: black),
                                  ))),
                          const SizedBox(width: 26),
                          Container(
                              margin: const EdgeInsets.fromLTRB(26, 53, 0, 0),
                              child: const Icon(
                                CupertinoIcons.textformat,
                                size: 28,
                                color: Color(0xFF5EAB39),
                              )),
                          Container(
                              padding: const EdgeInsets.fromLTRB(28, 201, 32, 23),
                              child: const Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '이름을 검색하면\n알약 이미지를 알려줘요',
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200, fontFamily: 'Inter-ExtraBold', color: black),
                                  )))
                        ])),
                    const SizedBox(width: 30),
                    CupertinoButton(
                        onPressed: () {},
                        child: Stack(children: [
                          Container(
                            width: 217,
                            height: 268,
                            decoration: BoxDecoration(color: main_color_yellow, borderRadius: BorderRadius.circular(15)),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(26, 133, 98, 81),
                              child: const Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    '비상 연락망\n등록하기',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, fontFamily: 'Inter-ExtraBold', color: black),
                                  ))),
                          const SizedBox(width: 26),
                          Container(
                              margin: const EdgeInsets.fromLTRB(26, 53, 0, 0),
                              child: const Icon(
                                CupertinoIcons.exclamationmark_circle_fill,
                                size: 28,
                                color: Color(0xFF9A9526),
                              )),
                          Container(
                              padding: const EdgeInsets.fromLTRB(28, 201, 32, 23),
                              child: const Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '약을 먹지 않으면\n등록된 번호로 알림을 보내요',
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200, fontFamily: 'Inter-ExtraBold', color: black),
                                  )))
                        ])),
                    const SizedBox(width: 200)
                  ],
                )),
            Flexible(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: more_green,
                  dotColor: dot_green,
                  dotWidth: 8.0,
                  radius: 4.0,
                  dotHeight: 8.0,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 3.0,
                ),
              ),
            )
          ],
        ));
  }
}
