import 'package:flutter_application/model/medication.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todays_medication_list_res.g.dart';

@JsonSerializable(explicitToJson: true)
class TodaysMedicationInfoListRes{
  List<Medication> medicationShortInfos;

  TodaysMedicationInfoListRes(
    this.medicationShortInfos
  );
  
  factory TodaysMedicationInfoListRes.fromJson(Map<String, dynamic> json) =>
      _$TodaysMedicationInfoListResFromJson(json);
  Map<String, dynamic> toJson() => _$TodaysMedicationInfoListResToJson(this);
}