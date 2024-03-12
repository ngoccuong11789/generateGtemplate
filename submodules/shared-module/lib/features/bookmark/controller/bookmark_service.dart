import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:shared_module/features/bookmark/model/bookmark_type.dart';
import 'package:shared_module/models/base_response.dart';

part 'bookmark_service.g.dart';

@RestApi()
abstract class BookmarkService {
  factory BookmarkService(Dio dio, {String? baseUrl}) = _BookmarkService;

  @GET("bookmarks/bookmarks/bloom-filter")
  Future<BaseResponse<BloomFilterContainer>> getBloomFilter();

  @POST("bookmarks/bookmarks")
  Future<BaseResponse<dynamic>> addBookmark(@Body() CreateBookMarkRequest body);

  @DELETE("bookmarks/bookmarks/{objectId}")
  Future<BaseResponse<dynamic>> removeBookmark(@Path() String objectId);

  @GET("bookmarks/bookmarks/{objectId}/is-existed")
  Future<BaseResponse<IsBookmarkedContainer>> checkIfBookmarked(
      @Path() String objectId);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BloomFilterContainer {
  final String? bloomFilter;

  BloomFilterContainer({required this.bloomFilter});

  factory BloomFilterContainer.fromJson(Map<String, dynamic> json) =>
      _$BloomFilterContainerFromJson(json);

  Map<String, dynamic> toJson() => _$BloomFilterContainerToJson(this);
}

String _bookmarkTypeToJson(BookmarkType type) => type.codeName;

BookmarkType _bookmarkTypeFromJson(String type) =>
    BookmarkType.fromCodeName(type);


@JsonSerializable(fieldRename: FieldRename.snake)
class CreateBookMarkRequest {
  final String objectId;
  final String? groupId;
  final String? groupName;

  @JsonKey(
      toJson: _bookmarkTypeToJson,
      fromJson: _bookmarkTypeFromJson
  )
  final BookmarkType dagObject;

  CreateBookMarkRequest({required this.objectId, required this.dagObject,this.groupId,this.groupName});

  factory CreateBookMarkRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBookMarkRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBookMarkRequestToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class IsBookmarkedContainer {
  final bool isExisted;

  IsBookmarkedContainer({required this.isExisted});

  factory IsBookmarkedContainer.fromJson(Map<String, dynamic> json) =>
      _$IsBookmarkedContainerFromJson(json);

  Map<String, dynamic> toJson() => _$IsBookmarkedContainerToJson(this);
}