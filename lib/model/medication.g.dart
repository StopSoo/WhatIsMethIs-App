// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medication _$MedicationFromJson(Map<String, dynamic> json) => Medication(
      json['medicationId'] as int?,
      json['medicineId'] as String?,
      json['medicineName'] as String?,
      json['medicineImage'] as String?,
      json['takeCapacity'] as int?,
      json['takeStartDate'] as String?,
      json['takeEndDate'] as String?,
      json['takeMealTime'] as String?,
      json['takeBeforeAfter'] as String?,
      json['takeCycle'] as int?,
      json['notificationTime'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$MedicationToJson(Medication instance) =>
    <String, dynamic>{
      'medicationId': instance.medicationId,
      'medicineId': instance.medicineId,
      'medicineName': instance.medicineName,
      'medicineImage': instance.medicineImage,
      'takeCapacity': instance.takeCapacity,
      'takeStartDate': instance.takeStartDate,
      'takeEndDate': instance.takeEndDate,
      'takeMealTime': instance.takeMealTime,
      'takeBeforeAfter': instance.takeBeforeAfter,
      'takeCycle': instance.takeCycle,
      'notificationTime': instance.notificationTime,
      'description': instance.description,
    };
