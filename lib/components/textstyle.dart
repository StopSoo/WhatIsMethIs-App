import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

const TextStyle headerTextStyle = TextStyle(
    fontFamily: 'NotoSans',
    color: CupertinoColors.black,
    fontWeight: FontWeight.w700,
    fontSize: 17,
  );

const TextStyle defaultTextStyle = TextStyle(
  fontFamily: 'Inter',
  color: CupertinoColors.black,
  fontWeight: FontWeight.w500,
);

const TextStyle defaultTextStyle_white = TextStyle(
  fontFamily: 'Inter',
  color: CupertinoColors.white,
);

const TextStyle defaultBoldTextStyle = TextStyle(
  fontFamily: 'Inter',
  color: CupertinoColors.black,
  fontWeight: FontWeight.bold,
);

const TextStyle defaultactionSheetTextStyle = TextStyle(
  fontFamily: 'NotoSans',
  fontWeight: FontWeight.w400,
  fontSize: 20,
);

const TextStyle cancelSheetTextStyle = TextStyle(
  fontFamily: 'NotoSans',
  fontWeight: FontWeight.w600,
  fontSize: 20,
);

/// [size_] is Text's FontSize
TextStyle blackTextStyle(double size_) {
  return TextStyle(
    fontFamily: 'Inter',
    color: CupertinoColors.black,
    fontWeight: FontWeight.w500,
    fontSize: size_,
  );
}

/// [size_] is Text's FontSize
TextStyle blackTextStyle_Bold(double size_) {
  return TextStyle(
    fontFamily: 'Inter',
    color: CupertinoColors.black,
    fontSize: size_,
    fontWeight: FontWeight.bold,
  );
}

/// [size_] is Text's FontSize
TextStyle darkGrayTextStyle(double size_) {
  return TextStyle(
    fontFamily: 'Inter',
    color: darkGrayColor,
    fontSize: size_,
  );
}

/// [size_] is Text's FontSize.
/// TextColor - <darkGrayColor>
/// FontWeight - <Bold>
TextStyle DarkGrayTextStyle_Bold(double size_) {
  return TextStyle(
    fontFamily: 'Inter',
    color: darkGrayColor,
    fontSize: size_,
    fontWeight: FontWeight.bold,
  );
}

/// [size_] is Text's FontSize.
/// [textColor] is Text's Color.
/// [textColor] is Text's FontWeight.
TextStyle customTextStyle(double size_, Color textColor, FontWeight fontWeight) {
  return TextStyle(
    fontFamily: 'Inter',
    color: textColor,
    fontWeight: fontWeight,
    fontSize: size_,
  );
}

/// [size_] is Text's FontSize.
TextStyle whiteTextStyle(double size_) {
  return TextStyle(
    fontFamily: 'Inter',
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: size_,
  );
}

/// [size_] is Text's FontSize.
/// FontWeight - <Bold>
TextStyle whiteTextStyle_Bold(double size_) {
  return TextStyle(
    fontFamily: 'Inter',
    color: Colors.white,
    fontSize: size_,
    fontWeight: FontWeight.bold,
  );
}

/// [size_] is Text's FontSize
TextStyle blueTextStyle(double size_) {
  return TextStyle(
    fontFamily: 'Inter',
    color: fontBlueColor,
    fontWeight: FontWeight.w500,
    fontSize: size_,
  );
}

/// [size_] is Text's FontSize
TextStyle greenTextStyle(double size_) {
  return TextStyle(
    fontFamily: 'Inter',
    color: greenColor,
    fontWeight: FontWeight.w500,
    fontSize: size_,
  );
}
