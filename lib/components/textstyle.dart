import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application/constants/colors.dart';


const TextStyle defaultTextStyle = TextStyle(
  fontFamily: 'NotosansKR',
  color: CupertinoColors.black,
);

const TextStyle defaultTextStyle_white = TextStyle(
  fontFamily: 'NotosansKR',
  color: CupertinoColors.white,
);

const TextStyle defaultBoldTextStyle = TextStyle(
  fontFamily: 'NotosansKR',
  color: CupertinoColors.black,
  fontWeight: FontWeight.bold,
);

/// [size_] is Text's FontSize
TextStyle blackTextStyle(double size_) {
  return TextStyle(
    fontFamily: 'NotosansKR',
    color: CupertinoColors.black,
    fontSize: size_,
  );
}

/// [size_] is Text's FontSize
TextStyle blackTextStyle_Bold(double size_) {
  return TextStyle(
    fontFamily: 'NotoSansKR',
    color: CupertinoColors.black,
    fontSize: size_,
    fontWeight: FontWeight.bold,
  );
}

/// [size_] is Text's FontSize
TextStyle darkGrayTextStyle(double size_) {
  return TextStyle(
    fontFamily: 'NotoSansKR',
    color: darkGrayColor,
    fontSize: size_,
  );
}

/// [size_] is Text's FontSize.
/// TextColor - <fontGray>
/// FontWeight - <Bold>
TextStyle DarkGrayTextStyle_Bold(double size_) {
  return TextStyle(
    fontFamily: 'NotoSansKR',
    color: darkGrayColor,
    fontSize: size_,
    fontWeight: FontWeight.bold,
  );
}

/// [size_] is Text's FontSize.
/// [textColor] is Text's Color.
TextStyle customTextStyle(double size_, Color textColor) {
  return TextStyle(
    fontFamily: 'NotoSansKR',
    color: textColor,
    fontSize: size_,
  );
}

const TextStyle defaultTextStyle_gray = TextStyle(
  fontFamily: 'NotoSansKR',
  color: Color.fromRGBO(0, 0, 0, 0.3),
);

/// [size_] is Text's FontSize.
TextStyle whiteTextStyle(double size_) {
  return TextStyle(
    fontFamily: 'NotoSansKR',
    color: Colors.white,
    fontSize: size_,
  );
}

/// [size_] is Text's FontSize.
/// FontWeight - <Bold>
TextStyle whiteTextStyle_Bold(double size_) {
  return TextStyle(
    fontFamily: 'NotoSansKR',
    color: Colors.white,
    fontSize: size_,
    fontWeight: FontWeight.bold,
  );
}

/// [size_] is Text's FontSize
TextStyle blueTextStyle(double size_) {
  return TextStyle(
    fontFamily: 'NotoSansKR',
    color: fontBlueColor,
    fontSize: size_,
  );
}