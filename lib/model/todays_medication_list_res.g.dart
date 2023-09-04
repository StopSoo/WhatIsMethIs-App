// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todays_medication_list_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodaysMedicationInfoListRes _$TodaysMedicationInfoListResFromJson(
        Map<String, dynamic> json) =>
    TodaysMedicationInfoListRes(
      (json['medicationShortInfos'] as List<dynamic>)
          .map((e) => Medication.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TodaysMedicationInfoListResToJson(
        TodaysMedicationInfoListRes instance) =>
    <String, dynamic>{
      'medicationShortInfos': instance.toJson(),
    };
