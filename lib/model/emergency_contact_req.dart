import 'package:json_annotation/json_annotation.dart';

part 'emergency_contact_req.g.dart';

@JsonSerializable()
class EmergencyContactReq{
  String? contact1;
  String? contact2;
  String? contact3;

  EmergencyContactReq(
    this.contact1,
    this.contact2,
    this.contact3
  );

  factory EmergencyContactReq.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactReqFromJson(json);
  Map<String, dynamic> toJson() => _$EmergencyContactReqToJson(this);
}