import 'package:json_annotation/json_annotation.dart';

import 'medication_short_info.dart';

part 'medication_info_list_res.g.dart';

@JsonSerializable(explicitToJson: true)
class MedicationInfoListRes{
  List<MedicationShortInfo> medicationShortInfos;
  int totalPages;

  MedicationInfoListRes(
    this.medicationShortInfos,
    this.totalPages
  );

  factory MedicationInfoListRes.fromJson(Map<String, dynamic> json) =>
      _$MedicationInfoListResFromJson(json);
  Map<String, dynamic> toJson() => _$MedicationInfoListResToJson(this);
  
}