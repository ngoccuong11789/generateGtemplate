import 'package:json_annotation/json_annotation.dart';

part 'country_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CountryDetailModel {
  final String countryId;
  final String countryName;
  final List<LocationProvince> provinces;

  CountryDetailModel(
      {required this.countryId,
      required this.countryName,
      required this.provinces});

  factory CountryDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDetailModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class LocationProvince {
  final String provinceId;
  final String provinceName;

  LocationProvince({required this.provinceId, required this.provinceName});

  factory LocationProvince.fromJson(Map<String, dynamic> json) =>
      _$LocationProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$LocationProvinceToJson(this);
}
