import 'package:json_annotation/json_annotation.dart';

part 'medicine.g.dart';

@JsonSerializable()
class Medicine{
  String? entpName;
  String? itemName;
  String? itemSeq;
  String? efcyQesitm;
  String? useMethodQesitm;
  String? atpnWarnQesitm;
  String? atpnQesitm;
  String? intrcQesitm;
  String? seQesitm;
  String? depositMethodQesitm;
  String? openDe;
  String? updateDe;
  String? itemImage;
  String? bizrno;

  Medicine(
    this.entpName,
    this.itemName,
    this.itemSeq,
    this.efcyQesitm,
    this.useMethodQesitm,
    this.atpnWarnQesitm,
    this.atpnQesitm,
    this.intrcQesitm,
    this.seQesitm,
    this.depositMethodQesitm,
    this.openDe,
    this.updateDe,
    this.itemImage,
    this.bizrno
  );

  factory Medicine.fromJson(Map<String, dynamic> json) =>
      _$MedicineFromJson(json);
  Map<String, dynamic> toJson() => _$MedicineToJson(this);
}