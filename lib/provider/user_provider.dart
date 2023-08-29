import 'package:flutter/cupertino.dart';

import '../model/user.dart';

class UserProvider with ChangeNotifier{
  User _user = User("", "", "", "", "", "", "", "");

  User getUserData(){
    return _user;
  }

  void setUserData(User user){
    _user.name = user.name;
    _user.age=user.age;
    _user.phoneNumber = user.phoneNumber;
    _user.emergencyContact1 = user.emergencyContact1;
    _user.emergencyContact2 = user.emergencyContact2;
    _user.emergencyContact3 = user.emergencyContact3;
    _user.refreshToken = user.refreshToken;
    _user.deviceToken = user.deviceToken;
    notifyListeners();
  }
}