// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_info_list_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineInfoListRes _$MedicineInfoListResFromJson(Map<String, dynamic> json) =>
    MedicineInfoListRes(
      json['pageNo'] as int,
      json['totalCount'] as int,
      json['numOfRows'] as int,
      (json['medicines'] as List<dynamic>)
          .map((e) => Medicine.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MedicineInfoListResToJson(
        MedicineInfoListRes instance) =>
    <String, dynamic>{
      'pageNo': instance.pageNo,
      'totalCount': instance.totalCount,
      'numOfRows': instance.numOfRows,
      'medicines': instance.medicines.map((e) => e.toJson()).toList(),
    };
