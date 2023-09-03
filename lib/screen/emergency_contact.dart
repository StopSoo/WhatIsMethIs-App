import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/controller/user_controller.dart';
import 'package:flutter_application/model/user.dart';
import 'package:flutter_application/model/emergency_contact_req.dart';
import 'package:flutter_application/provider/user_provider.dart';

import '../constants/colors.dart';
import '../components/component.dart';
import '../components/textstyle.dart';

import 'package:provider/provider.dart';

class EmergencyContact extends StatefulWidget {
  const EmergencyContact({Key? key}) : super(key: key);

  @override
  _EmergencyContactState createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool _deleteBox = false;
  late int contactCount;

  UserController _userController = UserController();
  late UserProvider _userProvider;
  User _user = User(null, "email", null, "name", null, "age", "phoneNumber",
      "loginCode", null, null, null, null, null);
  List<User> _contactList = [];
  List<bool> _isContactList = [];

  //비상연락망 등록 및 수정 API request용
  EmergencyContactReq contactReq = EmergencyContactReq(null, null, null);

  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _loadUserInfo();
  }

  //사용자 정보 가져오는 함수 - 로그인 구현 시 사라질 예정
  Future<void> _loadUserInfo() async {
    User user = await _userController.fetchUserInfo(4);
    setState(() {
      _user = user;
    });
  }

  //사용자에게 등록된 비상연락망 가져오기
  Future<void> _updateMyEmergencyContact(String? phoneNumber) async {
    if (phoneNumber == null) {
      return;
    }

    User? user =
        await _userController.fetchUserInfoWithPhoneNumber(phoneNumber);
    if (user != null) {
      setState(() {
        _contactList.add(user);
        _isContactList.add(true);
      });
    } else {
      setState(() {
        _isContactList.add(false);
      });
    }
  }

  bool _isPhoneNumberInContactList(String phoneNumber) {
    return _contactList.any((user) => user.phoneNumber == phoneNumber);
  }

  bool isPhoneNumberInMyEmergencyContactList(String phoneNumber) {
    if (_userProvider.getUserData().emergencyContact1 == phoneNumber ||
        _userProvider.getUserData().emergencyContact2 == phoneNumber ||
        _userProvider.getUserData().emergencyContact3 == phoneNumber) {
      return true;
    } else {
      return false;
    }
  }

  void setRequest() {
    contactReq.contact1 = _userProvider.getUserData().emergencyContact1;
    contactReq.contact2 = _userProvider.getUserData().emergencyContact2;
    contactReq.contact3 = _userProvider.getUserData().emergencyContact3;
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //로그인 구현시 사라질 예정..
    _userProvider.setUserData(_user);

    var emergencyContacts = [
      _userProvider.getUserData().emergencyContact1,
      _userProvider.getUserData().emergencyContact2,
      _userProvider.getUserData().emergencyContact3,
    ];

    contactCount =
        emergencyContacts.where((phoneNumber) => phoneNumber != null).length;
    setRequest();

    for (final phoneNumber in emergencyContacts) {
      if (phoneNumber != null && !_isPhoneNumberInContactList(phoneNumber)) {
        _updateMyEmergencyContact(phoneNumber);
      }
    }

    return safeAreaPage(
      Colors.white,
      Colors.white,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          defaultHeader(
              "비상 연락망", context, const Center(child: SizedBox(width: 28))),
          searchField(),
          if (!_deleteBox) descriptionBox(),
          _user.id == null
              ? const Center(child: CupertinoActivityIndicator())
              : contactListView(),
        ],
      ),
    );
  }

  Expanded contactListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: _contactList.length,
        itemBuilder: (context, index) {
          final image = _contactList[index].image;
          final name = _contactList[index].name;
          final phoneNumber = _contactList[index].phoneNumber;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            child: _isContactList[index]
                ? Dismissible(
                    key: Key(phoneNumber),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: redColor,
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 26),
                      child:
                          const Icon(CupertinoIcons.trash, color: Colors.white),
                    ),
                    onDismissed: (direction) async {
                      if (direction == DismissDirection.endToStart &&
                          _isContactList[index]) {
                        //삭제
                        if (index == 0) {
                          contactReq.contact1 = null;
                          _userProvider.getUserData().emergencyContact1 = null;
                        } else if (index == 1) {
                          contactReq.contact2 = null;
                          _userProvider.getUserData().emergencyContact2 = null;
                        } else if (index == 2) {
                          contactReq.contact3 = null;
                          _userProvider.getUserData().emergencyContact3 = null;
                        } else {
                          //예외처리
                        }

                        await _userController.patchEmergencyContact(contactReq);

                        //** TODO 새로고침
                        Navigator.pop(context);

                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => EmergencyContact()));
                        //------------------**
                      }
                    },
                    child: contactBox(
                        image, name, phoneNumber, _isContactList[index]),
                  )
                : contactBox(image, name, phoneNumber, _isContactList[index]),
          );
        },
      ),
    );
  }

  Container contactBox(
      String? image, String name, String phoneNumber, bool isContact) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: bright_gray,
            radius: 38,
            child: image == null
                ? const CircleAvatar(
                    backgroundColor: main_color_green,
                    radius: 36,
                    child: Text("💊"),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    radius: 36,
                  ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: darkGrayTextStyle(15)),
                const SizedBox(height: 5),
                Text(phoneNumber, style: greenTextStyle(13)),
              ],
            ),
          ),
          if (!isContact)
            CupertinoButton(
              minSize: 0,
              padding: const EdgeInsets.all(0),
              onPressed: () async {
                if (contactCount == 0) {
                  contactReq.contact1 = phoneNumber;
                  _userProvider.getUserData().emergencyContact1 = phoneNumber;
                } else if (contactCount == 1) {
                  contactReq.contact2 = phoneNumber;
                  _userProvider.getUserData().emergencyContact2 = phoneNumber;
                } else if (contactCount == 2) {
                  contactReq.contact3 = phoneNumber;
                  _userProvider.getUserData().emergencyContact3 = phoneNumber;
                } else {
                  //비상연락망 지우라고 팝업 띄우기
                }

                await _userController.patchEmergencyContact(contactReq);

                //** TODO 새로고침
                Navigator.pop(context);

                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => EmergencyContact()));
                //------------------**
              },
              child: const Icon(
                CupertinoIcons.plus_app,
                color: bright_green,
                size: 28,
              ),
            ),
        ],
      ),
    );
  }

  Widget descriptionBox() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 18, 25, 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bright_gray,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoButton(
                  onPressed: () {
                    setState(() {
                      _deleteBox = true;
                    });
                  },
                  minSize: 0,
                  padding: const EdgeInsets.fromLTRB(0, 10, 16, 0),
                  child: const Icon(CupertinoIcons.xmark_circle_fill,
                      color: CupertinoColors.secondaryLabel),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Text("비상 연락망이란?", style: blackTextStyle(16)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 5, 23, 30),
              child: Text(
                "이틀 연속 약을 복용하지 않았을 경우 혹시 모를 응급상황에 대비하기 위해 비상연락망에 등록된 친구에게 알림을 보내드립니다.",
                style: darkGrayTextStyle(15),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchField([double height = 60.0]) {
    return Container(
      color: Colors.white,
      height: height,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: CupertinoSearchTextField(
                  backgroundColor: bright_gray,
                  placeholder: "유저 아이디를 검색하세요",
                  focusNode: focusNode,
                  controller: controller,
                  style: darkGrayTextStyle(15),
                  onTap: () {
                    setState(() {
                      focusNode.requestFocus();
                    });
                  },
                  onSubmitted: (value) async {
                    final user = await _userController
                        .fetchUserInfoWithPhoneNumber(value);
                    final isContact =
                        isPhoneNumberInMyEmergencyContactList(value);

                    while (_contactList.length > contactCount) {
                      _contactList.removeLast();
                      _isContactList.removeLast();
                    }

                    setState(() {
                      _contactList.add(user);
                      _isContactList.add(isContact);
                    });

                    controller.clear();
                  },
                ),
              ),
            ),
            if (focusNode.hasFocus)
              Center(
                child: CupertinoButton(
                  padding: const EdgeInsets.only(left: 8.0),
                  onPressed: () {
                    setState(() {
                      controller.clear();
                      focusNode.unfocus();
                    });
                  },
                  child: Text("취소", style: blueTextStyle(17)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
