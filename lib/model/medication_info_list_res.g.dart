// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_info_list_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationInfoListRes _$MedicationInfoListResFromJson(
        Map<String, dynamic> json) =>
    MedicationInfoListRes(
      (json['medicationShortInfos'] as List<dynamic>)
          .map((e) => Medication.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalPages'] as int,
    );

Map<String, dynamic> _$MedicationInfoListResToJson(
        MedicationInfoListRes instance) =>
    <String, dynamic>{
      'medicationShortInfos':
          instance.medicationShortInfos.map((e) => e.toJson()).toList(),
      'totalPages': instance.totalPages,
    };
