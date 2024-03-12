import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(
    genericArgumentFactories: true,
    fieldRename: FieldRename.snake,
    explicitToJson: true)
class BaseResponse<T> {
  final T? data;
  final bool success;
  final Error? error;

  BaseResponse({
    required this.data,
    required this.success,
    required this.error,
  });

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Error {
  final int code;
  final String message;

  Error({
    required this.code,
    required this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

@JsonSerializable(
    genericArgumentFactories: true,
    explicitToJson: true,
    fieldRename: FieldRename.snake)
class BasePagingModel<T> extends Equatable {
  final List<T> data;
  final int page;
  final int pageSize;
  final int totalElement;

  BasePagingModel(
      {required this.data,
      required this.page,
      required this.pageSize,
      required this.totalElement});

  factory BasePagingModel.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    // Some time BE API use snake case, some time use camel case.
    // This will adapt 2 of these cases.
    json["page_size"] = json["pageSize"];
    json["total_element"] = json["totalElement"];
    return _$BasePagingModelFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BasePagingModelToJson(this, toJsonT);

  BasePagingModel<T> copyWith({
    List<T>? data,
    int? page,
    int? pageSize,
    int? totalElement,
  }) {
    return BasePagingModel(
      data: data ?? this.data,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      totalElement: totalElement ?? this.totalElement,
    );
  }

  @override
  List<Object?> get props =>[data];
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class BasePagingContainer<T> {
  final BasePagingModel<T> responsePage;

  BasePagingContainer({required this.responsePage});

  factory BasePagingContainer.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BasePagingContainerFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BasePagingContainerToJson(this, toJsonT);
}


