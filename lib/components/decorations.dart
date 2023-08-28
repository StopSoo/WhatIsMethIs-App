import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constants/colors.dart';

BoxDecoration textFieldDecoration() {
  return BoxDecoration(
    border: Border.all(
      color: bright_green,
      width: 1.0,
      style: BorderStyle.solid,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(10.0),
    ), // 둥근 테두리 설정
  );
}
