import 'package:flutter/cupertino.dart';

import '../model/user.dart';

class UserProvider with ChangeNotifier {
  final User _user = User(1, "", null, "name", "age", "phoneNumber", "loginCode", null, null, null, null, null);

  User getUserData() {
    return _user;
  }

  void setUserData(User user) {
    _user.id = user.id;
    _user.email = user.email;
    _user.password = user.password;
    _user.name = user.name;
    _user.age = user.age;
    _user.phoneNumber = user.phoneNumber;
    _user.loginCode = user.loginCode;
    _user.emergencyContact1 = user.emergencyContact1;
    _user.emergencyContact2 = user.emergencyContact2;
    _user.emergencyContact3 = user.emergencyContact3;
    _user.refreshToken = user.refreshToken;
    _user.deviceToken = user.deviceToken;
    notifyListeners();
  }
}
