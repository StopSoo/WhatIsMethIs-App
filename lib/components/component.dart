import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constants/colors.dart';

import 'textstyle.dart';

Widget safeAreaPage(Color backgroundColor, Color safeAreaColor, Widget widget) {
  return Container(
    color: backgroundColor,
    child: SafeArea(
      child: Container(
        color: safeAreaColor,
        child: widget,
      ),
    ),
  );
}

Widget CupertinoTextButton(String text) {
  return CupertinoButton(
    onPressed: () {},
    padding: EdgeInsets.zero,
    child: Text(text, style: blueTextStyle(16)),
  );
}

Widget defaultHeader(String centerText, BuildContext context, Widget rightWidget, [double height = 50.0]) {
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
              padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                CupertinoIcons.chevron_back,
                color: bright_green,
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
            child: rightWidget,
          ),
        ],
      ),
    ),
  );
}

Padding pillDetailBox(String title, String content) {
  if (content.isEmpty) {
    return const Padding(padding: EdgeInsets.zero);
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
        const SizedBox(height: 6),
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
          color: main_color_green,
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
