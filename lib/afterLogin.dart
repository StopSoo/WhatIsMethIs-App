import 'package:flutter/material.dart';
import './constants/colors.dart';

class afterLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 390,
                  height: 44,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 390,
                        height: 44,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 219,
                              height: 30,
                              child: Stack(children: [
                              ,
                              ]),
                            ),
                            Container(
                              width: 54,
                              height: 21,
                              padding: const EdgeInsets.only(
                                top: 5.17,
                                left: 12.45,
                                right: 13.12,
                                bottom: 4.74,
                              ),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                ,
                                ],
                              ),
                            ),
                            Container(
                              width: 66.66,
                              height: 11.34,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 42.33,
                                    top: 0,
                                    child: Container(
                                      width: 24.33,
                                      height: 11.33,
                                      child: Stack(children: [
                                      ,
                                      ]),
                                    ),
                                  ),
                                  Positioned(
                                    left: 22.03,
                                    top: 0,
                                    child: Container(
                                      width: 15.27,
                                      height: 10.97,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage("https://via.placeholder.com/15x11"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0.34,
                                    child: Container(
                                      width: 17,
                                      height: 10.67,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage("https://via.placeholder.com/17x11"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 33,
                top: 94,
                child: Text(
                  '오늘의 복약 정보',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0.92,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
              Positioned(
                left: 331,
                top: 91,
                child: Container(
                  width: 28,
                  height: 28,
                  padding: const EdgeInsets.only(left: 3, right: 2.90),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 22.10,
                        height: 4.70,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 22.10,
                              height: 4.70,
                              child: Stack(children: [
                              ,
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 33,
                top: 140,
                child: Container(
                  width: 293,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 98,
                        top: 15,
                        child: Container(
                          width: 195,
                          height: 50,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 28,
                                child: Text(
                                  '타이레놀8시간이알서방정',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF6D6D6D),
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 1.47,
                                    letterSpacing: -0.41,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  '점심 직후',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 1.47,
                                    letterSpacing: -0.41,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 174,
                                top: 28,
                                child: Text(
                                  '1정',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF6D6D6D),
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 1.47,
                                    letterSpacing: -0.41,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 80,
                          height: 80,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 28,
                                top: 29,
                                child: Text(
                                  '💊',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0.92,
                                    letterSpacing: -0.41,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 33,
                top: 240,
                child: Container(
                  width: 293,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 98,
                        top: 15,
                        child: Container(
                          width: 195,
                          height: 50,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 28,
                                child: Text(
                                  '타이레놀8시간이알서방정',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF6D6D6D),
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 1.47,
                                    letterSpacing: -0.41,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  '저녁 직후',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 1.47,
                                    letterSpacing: -0.41,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 174,
                                top: 28,
                                child: Text(
                                  '1정',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF6D6D6D),
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 1.47,
                                    letterSpacing: -0.41,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 80,
                          height: 80,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 28,
                                top: 29,
                                child: Text(
                                  '💊',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0.92,
                                    letterSpacing: -0.41,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 161,
                top: 340,
                child: Container(
                  width: 68,
                  height: 22,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 41.65,
                          child: Text(
                            '더보기',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 1.47,
                              letterSpacing: -0.41,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 45.65,
                        top: 0,
                        child: Container(
                          width: 22.35,
                          height: 22,
                          padding: const EdgeInsets.only(
                            top: 5,
                            left: 1,
                            right: 0.99,
                            bottom: 4.52,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 20.36,
                                height: 12.48,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 20.36,
                                      height: 12.48,
                                      child: Stack(children: [
                                      ,
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 33,
                top: 420,
                child: Container(
                  width: 217,
                  height: 268,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 217,
                          height: 268,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFFFCB5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 26,
                        top: 133,
                        child: Text(
                          '사진으로\n알약 찾기',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0.92,
                            letterSpacing: -0.41,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 28,
                        top: 201,
                        child: SizedBox(
                          width: 157,
                          child: Text(
                            '알약을 카메라로 찍으면                            이름을 알려줘요',
                            style: TextStyle(
                              color: Color(0xFF6D6D6D),
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 1.47,
                              letterSpacing: -0.41,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 26,
                        top: 53,
                        child: Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.only(top: 1, bottom: 1.56),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 29.87,
                                height: 25.44,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 29.87,
                                      height: 25.44,
                                      child: Stack(children: [
                                      ,
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 283,
                top: 420,
                child: Container(
                  width: 217,
                  height: 268,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 217,
                          height: 268,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD0F5BE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 26,
                        top: 133,
                        child: Text(
                          '이름으로\n알약 찾기',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0.92,
                            letterSpacing: -0.41,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 28,
                        top: 201,
                        child: SizedBox(
                          width: 157,
                          child: Text(
                            '이름을 검색하면                            알약 이미지를 알려줘요',
                            style: TextStyle(
                              color: Color(0xFF6D6D6D),
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 1.47,
                              letterSpacing: -0.41,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 26,
                        top: 59,
                        child: Container(
                          width: 21.57,
                          height: 21.60,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 21.57,
                                height: 21.60,
                                child: Stack(children: [
                                ,
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 179,
                top: 708,
                child: Container(
                  width: 32,
                  height: 8,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: ShapeDecoration(
                            color: Color(0xFF6FCD41),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 0,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD0F5BE),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 24,
                        top: 0,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD0F5BE),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 810,
                child: Container(
                  width: 390,
                  height: 34,
                  padding: const EdgeInsets.only(
                    top: 21,
                    left: 128,
                    right: 128,
                    bottom: 8,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 134,
                        height: 5,
                        decoration: ShapeDecoration(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 353,
                top: 232,
                child: Container(
                  width: 6,
                  height: 70,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 5,
                top: 52,
                child: Text(
                  '(대충 앱 로고)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.10,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
              Positioned(
                left: 346,
                top: 49,
                child: Container(
                  width: 28,
                  height: 28,
                  padding: const EdgeInsets.only(
                    top: 3,
                    left: 4,
                    right: 3.53,
                    bottom: 2.91,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 20.47,
                        height: 22.09,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 20.47,
                              height: 22.09,
                              child: Stack(children: [
                              ,
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}