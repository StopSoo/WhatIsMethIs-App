import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotIndicatorWidget extends StatefulWidget {
  @override
  _DotIndicatorWidgetState createState() => _DotIndicatorWidgetState();
}

class _DotIndicatorWidgetState extends State<DotIndicatorWidget> {

  var controller;
  @override
  void initState() {
    controller = new PageController(
      viewportFraction: 0.8,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      height:400,
      child: Column(
        children: <Widget>[
          SizedBox(
            height:400,
            // pageview
            child: new PageView(  
              controller: controller,
              
                children: <Widget>[
                  // 알약 찾기 위젯 가로 스크롤
                  Column(
                    children: [
                      Row(
                        children: [
                          CupertinoButton(
                              onPressed: () {},
                              minSize: 0,
                              padding: EdgeInsets.all(0),
                              child: Stack(children: [
                                Container(
                                  width: 217,
                                  height: 268,
                                  decoration: BoxDecoration(
                                    color: main_color_yellow,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(26, 133, 98, 81),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      '사진으로\n알약 찾기',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Inter-ExtraBold',
                                        color: black
                                      ),
                                    )
                                  )
                                ),
                                SizedBox(width: 26),
                                Container(
                                  margin: EdgeInsets.fromLTRB(26, 53, 0, 0),
                                  child: Icon(
                                    CupertinoIcons.photo_on_rectangle,
                                    size: 28,
                                    color: Color(0xFF9A9526),
                                  )
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(28, 201, 32, 23),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      '알약을 카메라로 찍으면\n이름을 알려줘요',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: 'Inter-ExtraBold',
                                        color: black
                                      ),
                                    )
                                  )
                                )
                              ]
                            )
                            ),
                            SizedBox(width: 30, height: 268),
                            CupertinoButton(
                              onPressed: () {},
                              minSize: 0,
                              padding: EdgeInsets.all(0),
                              child: Stack(children: [
                                Container(
                                  width: 217,
                                  height: 268,
                                  decoration: BoxDecoration(
                                    color: main_color_green,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(26, 133, 98, 81),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      '이름으로\n알약 찾기',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Inter-ExtraBold',
                                        color: black
                                      ),
                                    )
                                  )
                                ),
                                SizedBox(width: 26),
                                Container(
                                  margin: EdgeInsets.fromLTRB(26, 53, 0, 0),
                                  child: Icon(
                                    CupertinoIcons.textformat,
                                    size: 28,
                                    color: Color(0xFF5EAB39),
                                  )
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(28, 201, 32, 23),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      '이름을 검색하면\n알약 이미지를 알려줘요',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: 'Inter-ExtraBold',
                                        color: black
                                      ),
                                    )
                                  )
                                )
                              ]
                            )),
                            SizedBox(width: 33, height: 268),
                            CupertinoButton(
                              onPressed: () {},
                              child: Stack(
                                children: [
                                  Container(
                                  width: 217,
                                  height: 268,
                                  decoration: BoxDecoration(
                                    color: main_color_yellow,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(26, 133, 98, 81),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        '비상 연락망\n등록하기',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Inter-ExtraBold',
                                          color: black
                                        ),
                                      )
                                    )
                                  ),
                                  SizedBox(width: 26),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(26, 53, 0, 0),
                                    child: Icon(
                                      CupertinoIcons.exclamationmark_circle_fill,
                                      size: 28,
                                      color: Color(0xFF9A9526),
                                    )
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(28, 201, 32, 23),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        '약을 먹지 않으면\n등록된 번호로 알림을 보내요',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w200,
                                          fontFamily: 'Inter-ExtraBold',
                                          color: black
                                        ),
                                      )
                                    )
                                  )
                                ]
                              )
                            ),
                        ],
                      ),
                      Flexible(
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: WormEffect(),
                        ),
                      )
                    ]
                  ),
                  ],
                ),
              ),
            ],
          )
    );
  }
}
