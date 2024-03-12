
import 'package:json_annotation/json_annotation.dart';

part 'invoices_res.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class InVoicesRes {
  final String? id;
  final String? createdAt;
  final String? createdBy;
  final String? updatedAt;
  final String? updatedBy;
  final String? companyName;
  final String? companyAddress;
  final String? email;
  final String? taxCode;

  InVoicesRes(
      {this.id,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.companyName,
      this.companyAddress,
      this.email,
      this.taxCode});

  factory InVoicesRes.fromJson(Map<String, dynamic> json) {
    return _$InVoicesResFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$InVoicesResToJson(this);
  }

  InVoicesRes copyWith({
    String? id,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
    String? companyName,
    String? companyAddress,
    String? email,
    String? taxCode,
  }) {
    return InVoicesRes(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      updatedAt: updatedAt ?? this.updatedAt,
      updatedBy: updatedBy ?? this.updatedBy,
      companyName: companyName ?? this.companyName,
      companyAddress: companyAddress ?? this.companyAddress,
      email: email ?? this.email,
      taxCode: taxCode ?? this.taxCode,
    );
  }
}