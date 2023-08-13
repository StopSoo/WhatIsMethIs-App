import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
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
    onPressed: (){},
    padding: EdgeInsets.zero,
    child: Text(
      text,
      style: blueTextStyle(16)
    ),
  );
}

Widget resultHeader(String centerText, BuildContext context,
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
                color: greenColor,
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
                color: greenColor,
                size: 28,
              ),
            ),
          )
        ],
      ),
    ),
  );
}