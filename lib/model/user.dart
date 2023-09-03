
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String email;
  String? password;
  String name;
  String age;
  String phoneNumber;
  String loginCode;
  String? emergencyContact1;
  String? emergencyContact2;
  String? emergencyContact3;
  String? refreshToken;
  String? deviceToken;

  User(
    this.id,
    this.email,
    this.password,
    this.name,
    this.age,
    this.phoneNumber,
    this.loginCode,
    this.emergencyContact1,
    this.emergencyContact2,
    this.emergencyContact3,
    this.refreshToken,
    this.deviceToken,
  );

    factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
