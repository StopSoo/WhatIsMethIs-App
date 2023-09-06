// 애플리케이션 메인 화면 : 로그인 후
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/components/textstyle.dart';
import 'package:flutter_application/constants/colors.dart';
import 'package:flutter_application/controller/medicine_controller.dart';
import 'package:flutter_application/model/medication.dart';
import 'package:flutter_application/screen/medication_info.dart';
import 'package:flutter_application/screen/myPage.dart';
import 'package:flutter_application/widget/findMedWidget.dart';

class MyHomePage_after extends StatefulWidget {
  const MyHomePage_after({super.key});

  @override
  State<MyHomePage_after> createState() => _MyHomePage_afterState();
}

class _MyHomePage_afterState extends State<MyHomePage_after> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(child: HomeScreen()),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 알약 찾기 위젯 번호
  int currentIndexPage = 0;
  List<Medication>? medicineInfoListRes;

  @override
  void initState() {
    super.initState();
    fetchTodayMedicineData();
  }

  Future<void> fetchTodayMedicineData() async {
    List<Medication>? result = await fetchTodayMedicine();
    setState(() {
      medicineInfoListRes = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // 전체 Container에 왼쪽 패딩 적용
      padding: const EdgeInsets.fromLTRB(33, 80, 20, 0),
      child: Column(
        children: <Widget>[
          // 로고와 마이 페이지
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Image.asset(alignment: Alignment.topLeft, 'assets/images/icon_logo.png', fit: BoxFit.contain, height: 45),
            const Spacer(),
            CupertinoButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => const MyPage()));
              },
              child: const Icon(
                CupertinoIcons.person,
                size: 28,
                color: black,
              ),
            ),
          ]),
          const SizedBox(height: 20, width: 200),
          // 오늘의 복약 정보
          Row(
            children: <Widget>[
              CupertinoButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return const MedicationInfo();
                    },
                  ));
                },
                minSize: 0,
                padding: const EdgeInsets.all(0),
                child: const Text(
                  '오늘의 복약 정보',
                  style: TextStyle(fontSize: 24, color: black),
                ),
              ),
              const SizedBox(height: 28, width: 10),
              CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                      builder: (BuildContext context) {
                        return const MedicationInfo();
                      },
                    ));
                  },
                  minSize: 0,
                  padding: const EdgeInsets.all(0),
                  child: const Column(children: [
                    Icon(
                      CupertinoIcons.chevron_forward,
                      size: 28,
                      color: black,
                    ),
                  ])),
            ],
          ),
          // 해당 날짜의 복약 정보
          Column(children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: Row(
                children: [
                  Container(
                    child: CircleAvatar(
                      backgroundColor: main_color_green,
                      radius: 40,
                      child: medicineInfoListRes?[0].medicineImage == null
                      ? const Text("💊")
                      : CircleAvatar(
                        backgroundImage: NetworkImage(medicineInfoListRes![0].medicineImage!),
                        radius: 38,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80, width: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        medicineInfoListRes?[0].takeMealTime == null ? '' :
                        '${mealTime[medicineInfoListRes![0].takeMealTime] ?? ''} ${beforeAfterTime[medicineInfoListRes![0].takeBeforeAfter] ?? ''}',
                        style: darkGrayTextStyle(15),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            medicineInfoListRes?[0].medicineName == null ? '' :
                              (medicineInfoListRes![0].medicineName!.length > 15
                              ? '${medicineInfoListRes![0].medicineName!.substring(0, 15)}...'
                              : medicineInfoListRes![0].medicineName!), // Row 오버플로우 방지
                            style: darkGrayTextStyle(15),
                            softWrap: true,
                          ),
                          SizedBox(width: 10),
                          Text(
                            medicineInfoListRes?[0].takeCapacity == null ? '' :
                            '${medicineInfoListRes![0].takeCapacity.toString()} 정',
                            style: darkGrayTextStyle(15),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20, width: 100),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                children: [
                  Container(
                    child: CircleAvatar(
                      backgroundColor: main_color_green,
                      radius: 40,
                      child: medicineInfoListRes?[1].medicineImage == null
                      ? const Text("💊")
                      : CircleAvatar(
                        backgroundImage: NetworkImage(medicineInfoListRes![1].medicineImage!),
                        radius: 38,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80, width: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        medicineInfoListRes?[1].takeMealTime == null ? '' :
                        '${mealTime[medicineInfoListRes![1].takeMealTime] ?? ''} ${beforeAfterTime[medicineInfoListRes![1].takeBeforeAfter] ?? ''}',
                        style: darkGrayTextStyle(15),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            medicineInfoListRes?[1].medicineName == null ? '' :
                              (medicineInfoListRes![1].medicineName!.length > 15
                              ? '${medicineInfoListRes![1].medicineName!.substring(0, 15)}...'
                              : medicineInfoListRes![1].medicineName!), // Row 오버플로우 방지
                            style: darkGrayTextStyle(15),
                            softWrap: true,
                          ),
                          SizedBox(width: 10),
                          Text(
                            medicineInfoListRes?[1].takeCapacity == null ? '' :
                            '${medicineInfoListRes![1].takeCapacity.toString()} 정',
                            style: darkGrayTextStyle(15),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CupertinoButton(
                onPressed: () {},
                minSize: 0,
                padding: const EdgeInsets.all(0),
                child: const Text(
                  '더보기',
                  style: TextStyle(fontSize: 15, color: black),
                ),
              ),
              const SizedBox(height: 22, width: 4),
              CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: const EdgeInsets.all(0),
                  child: const Icon(
                    CupertinoIcons.chevron_down,
                    size: 25,
                    color: black,
                  )),
            ])
          ]),
          const SizedBox(height: 56),
          // 알약 찾기 위젯
          const FindMedWidget()
        ],
      ),
    );
  }
}