// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_short_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationShortInfo _$MedicationShortInfoFromJson(Map<String, dynamic> json) =>
    MedicationShortInfo(
      json['medicationId'] as int,
      json['medicineName'] as String,
      json['medicineImage'] as String,
      json['takeMealTime'] as String,
      json['takeBeforeAfter'] as String,
      json['takeCapacity'] as int,
    );

Map<String, dynamic> _$MedicationShortInfoToJson(
        MedicationShortInfo instance) =>
    <String, dynamic>{
      'medicationId': instance.medicationId,
      'medicineName': instance.medicineName,
      'medicineImage': instance.medicineImage,
      'takeMealTime': instance.takeMealTime,
      'takeBeforeAfter': instance.takeBeforeAfter,
      'takeCapacity': instance.takeCapacity,
    };
