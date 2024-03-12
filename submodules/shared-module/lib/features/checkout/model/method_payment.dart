import 'package:json_annotation/json_annotation.dart';

part 'method_payment.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class MethodPayment {
  final List<DataMethodPayment> data;

  MethodPayment({this.data = const []});

  factory MethodPayment.fromJson(Map<String, dynamic> json) {
    return _$MethodPaymentFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MethodPaymentToJson(this);
  }

  @override
  String toString() {
    return 'MethodPayment{data: $data}';
  }

  MethodPayment copyWith({
    List<DataMethodPayment>? data,
  }) {
    return MethodPayment(
      data: data ?? this.data,
    );
  }
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class DataMethodPayment {
  final String? id;
  final String? createdAt;
  final String? createdBy;
  final String? updatedAt;
  final String? updatedBy;
  final String? code;
  final String? name;
  late bool isSelect;

  DataMethodPayment(
      {this.id,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.code,
      this.name,
      this.isSelect = false});

  factory DataMethodPayment.fromJson(Map<String, dynamic> json) {
    return _$DataMethodPaymentFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataMethodPaymentToJson(this);
  }

  @override
  String toString() {
    return 'DataMethodPayment{id: $id, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy, code: $code, name: $name, isSelect: $isSelect}';
  }

  bool get isCOD => code == "1";
}
