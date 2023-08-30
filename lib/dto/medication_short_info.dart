import 'package:json_annotation/json_annotation.dart';

part 'medication_short_info.g.dart';

@JsonSerializable()
class MedicationShortInfo{
  int medicationId;
  String medicineName;
  String medicineImage;
  String takeMealTime;
  String takeBeforeAfter;
  int takeCapacity;

  MedicationShortInfo(
    this.medicationId,
    this.medicineName,
    this.medicineImage,
    this.takeMealTime,
    this.takeBeforeAfter,
    this.takeCapacity
  );

  factory MedicationShortInfo.fromJson(Map<String, dynamic> json) =>
      _$MedicationShortInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MedicationShortInfoToJson(this);

}