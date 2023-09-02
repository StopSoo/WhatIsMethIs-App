import 'package:json_annotation/json_annotation.dart';

part 'medication.g.dart';

@JsonSerializable()
class Medication{
  int? medicationId;
  String? medicineId;
  String? medicineName;
  String? medicineImage;
  int? takeCapacity;
  String? takeStartDate;
  String? takeEndDate;
  String? takeMealTime;
  String? takeBeforeAfter;
  int? takeCycle;
  String? notificationTime;
  String? description;

  Medication(
    this.medicationId,
    this.medicineId,
    this.medicineName,
    this.medicineImage,
    this.takeCapacity,
    this.takeStartDate,
    this.takeEndDate,
    this.takeMealTime,
    this.takeBeforeAfter,
    this.takeCycle,
    this.notificationTime,
    this.description
);

factory Medication.fromJson(Map<String, dynamic> json) =>
      _$MedicationFromJson(json);
  Map<String, dynamic> toJson() => _$MedicationToJson(this);
  
}
