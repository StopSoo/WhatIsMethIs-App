import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../components/component.dart';
import '../components/textstyle.dart';

class EmergencyContact extends StatefulWidget {
  const EmergencyContact({Key? key}) : super(key: key);

  @override
  _EmergencyContactState createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool _deleteBox = false;

  List<String> images = List.generate(3, (index) => 'assets/images/test_cat.jpg');
  List<String> names = List.generate(3, (index) => 'Name ${index + 1}');
  List<String> ids = List.generate(3, (index) => 'Item id${index + 1}');
  List<bool> contacts = [false, true, true];

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return safeAreaPage(
      Colors.white,
      Colors.white,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          defaultHeader("비상 연락망", context, const Center(child: SizedBox(width: 28))),
          searchField(),
          if (!_deleteBox) descriptionBox(),
          contactListView(),
        ],
      ),
    );
  }

  Expanded contactListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          final id = ids[index];
          final image = images[index];
          final name = names[index];
          final isContact = contacts[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            child: isContact
                ? Dismissible(
                    key: Key(id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: redColor,
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 26),
                      child: const Icon(CupertinoIcons.trash, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart && isContact) {
                        setState(() {
                          images.removeAt(index);
                          ids.removeAt(index);
                          names.removeAt(index);
                          contacts.removeAt(index);
                        });
                      }
                    },
                    child: contactBox(image, name, id, isContact),
                  )
                : contactBox(image, name, id, isContact),
          );
        },
      ),
    );
  }

  Container contactBox(String image, String name, String id, bool isContact) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: gray,
            radius: 38,
            child: image.isEmpty
                ? const Text("💊")
                : CircleAvatar(
                    backgroundImage: AssetImage(image),
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
                Text(id, style: greenTextStyle(13)),
              ],
            ),
          ),
          if (!isContact)
            CupertinoButton(
              minSize: 0,
              padding: const EdgeInsets.all(0),
              onPressed: () {},
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
          color: gray,
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
                  child: const Icon(CupertinoIcons.xmark_circle_fill, color: CupertinoColors.secondaryLabel),
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
                  placeholder: "유저 아이디를 검색하세요",
                  focusNode: focusNode,
                  controller: controller,
                  style: darkGrayTextStyle(15),
                  onTap: () {
                    setState(() {
                      focusNode.requestFocus();
                    });
                  },
                  onSubmitted: (value) {
                    // Todo: call contactSearchAPI
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
