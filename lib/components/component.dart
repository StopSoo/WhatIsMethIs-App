import 'package:flutter/cupertino.dart';

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