// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloomFilterContainer _$BloomFilterContainerFromJson(
        Map<String, dynamic> json) =>
    BloomFilterContainer(
      bloomFilter: json['bloom_filter'] as String?,
    );

Map<String, dynamic> _$BloomFilterContainerToJson(
        BloomFilterContainer instance) =>
    <String, dynamic>{
      'bloom_filter': instance.bloomFilter,
    };

CreateBookMarkRequest _$CreateBookMarkRequestFromJson(
        Map<String, dynamic> json) =>
    CreateBookMarkRequest(
      objectId: json['object_id'] as String,
      dagObject: _bookmarkTypeFromJson(json['dag_object'] as String),
      groupId: json['group_id'] as String?,
      groupName: json['group_name'] as String?,
    );

Map<String, dynamic> _$CreateBookMarkRequestToJson(
        CreateBookMarkRequest instance) =>
    <String, dynamic>{
      'object_id': instance.objectId,
      'group_id': instance.groupId,
      'group_name': instance.groupName,
      'dag_object': _bookmarkTypeToJson(instance.dagObject),
    };

IsBookmarkedContainer _$IsBookmarkedContainerFromJson(
        Map<String, dynamic> json) =>
    IsBookmarkedContainer(
      isExisted: json['is_existed'] as bool,
    );

Map<String, dynamic> _$IsBookmarkedContainerToJson(
        IsBookmarkedContainer instance) =>
    <String, dynamic>{
      'is_existed': instance.isExisted,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _BookmarkService implements BookmarkService {
  _BookmarkService(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponse<BloomFilterContainer>> getBloomFilter() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<BloomFilterContainer>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'bookmarks/bookmarks/bloom-filter',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<BloomFilterContainer>.fromJson(
      _result.data!,
      (json) => BloomFilterContainer.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponse<dynamic>> addBookmark(CreateBookMarkRequest body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'bookmarks/bookmarks',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<BaseResponse<dynamic>> removeBookmark(String objectId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<dynamic>>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'bookmarks/bookmarks/${objectId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<BaseResponse<IsBookmarkedContainer>> checkIfBookmarked(
      String objectId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<IsBookmarkedContainer>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'bookmarks/bookmarks/${objectId}/is-existed',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<IsBookmarkedContainer>.fromJson(
      _result.data!,
      (json) => IsBookmarkedContainer.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
