// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int?,
      json['email'] as String,
      json['password'] as String?,
      json['name'] as String,
      json['image'] as String?,
      json['age'] as String,
      json['phoneNumber'] as String,
      json['loginCode'] as String,
      json['emergencyContact1'] as String?,
      json['emergencyContact2'] as String?,
      json['emergencyContact3'] as String?,
      json['refreshToken'] as String?,
      json['deviceToken'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'image': instance.image,
      'age': instance.age,
      'phoneNumber': instance.phoneNumber,
      'loginCode': instance.loginCode,
      'emergencyContact1': instance.emergencyContact1,
      'emergencyContact2': instance.emergencyContact2,
      'emergencyContact3': instance.emergencyContact3,
      'refreshToken': instance.refreshToken,
      'deviceToken': instance.deviceToken,
    };
