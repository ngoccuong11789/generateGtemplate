// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      success: json['success'] as bool,
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'success': instance.success,
      'error': instance.error?.toJson(),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: json['code'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

BasePagingModel<T> _$BasePagingModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BasePagingModel<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      page: json['page'] as int,
      pageSize: json['page_size'] as int,
      totalElement: json['total_element'] as int,
    );

Map<String, dynamic> _$BasePagingModelToJson<T>(
  BasePagingModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'page': instance.page,
      'page_size': instance.pageSize,
      'total_element': instance.totalElement,
    };

BasePagingContainer<T> _$BasePagingContainerFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BasePagingContainer<T>(
      responsePage: BasePagingModel<T>.fromJson(
          json['responsePage'] as Map<String, dynamic>,
          (value) => fromJsonT(value)),
    );

Map<String, dynamic> _$BasePagingContainerToJson<T>(
  BasePagingContainer<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'responsePage': instance.responsePage.toJson(
        (value) => toJsonT(value),
      ),
    };
