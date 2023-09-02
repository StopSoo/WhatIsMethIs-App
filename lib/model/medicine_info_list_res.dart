import '../model/medicine.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medicine_info_list_res.g.dart';

@JsonSerializable(explicitToJson: true)
class MedicineInfoListRes{
  int pageNo;
  int totalCount;
  int numOfRows;
  List<Medicine> medicines;

  MedicineInfoListRes(
    this.pageNo,
    this.totalCount,
    this.numOfRows,
    this.medicines,
  );

  factory MedicineInfoListRes.fromJson(Map<String, dynamic> json) =>
      _$MedicineInfoListResFromJson(json);
  Map<String, dynamic> toJson() => _$MedicineInfoListResToJson(this);
}