import 'package:intl/intl.dart';

String formatDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);

  String formattedDate = DateFormat.yMMMMd('ko_KR').format(dateTime);

  return formattedDate;
}

String formatTime(String inputTime) {
  DateTime dateTime = DateFormat("HH:mm:ss").parse(inputTime);

  String formattedTime = DateFormat.jm('ko_KR').format(dateTime);

  return formattedTime;
}

DateTime string2Date(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);

  return dateTime;
}

String date2String(DateTime dateTime) {
  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

  return formattedDate;
}

String time2String(DateTime dateTime) {
  String formattedTime = DateFormat("HH:mm:ss").format(dateTime);

  return formattedTime;
}

DateTime string2Time(String inputTime) {
  //더미 날짜
  String dummyDate = "2023-09-03";
  DateTime dateTime = DateTime.parse("$dummyDate $inputTime");

  return dateTime;
}
