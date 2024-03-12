import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:car_rental/core/utils/logging.dart';

import '../../models/bookmark/car_collection_model.dart';

part 'car_collection_services.g.dart';

@RestApi(baseUrl: '')
abstract class CarCollectionServices {
  static final log = logger(CarCollectionServices);
  factory CarCollectionServices(Dio dio, {String baseUrl}) = _CarCollectionServices;

  @GET('/bookmarks/bookmarks/groups/search/tab')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'Custom-Header': 'application/json',
  })
  Future<HttpResponse> getListCollection(
    @Query('pageSize') int? pageSize,
    @Query('pageNum') int? pageNum,
    @Query('subCategoryType') String? subCategoryType,

  );

  @POST('bookmarks/bookmarks/groups')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'Custom-Header': 'application/json',
  })
  Future<HttpResponse> createBookmarkGroup(
    @Body() Map<String, dynamic> body,
    );

  @PUT("/bookmarks/bookmarks/{object_id}/group/{group_id}")
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'Custom-Header': 'application/json',
  })
  Future<HttpResponse> updateBookmarkGroup(
    @Path('object_id') String object_id,
    @Path('group_id') String group_id,
  );

}

//flutter pub run build_runner build --delete-conflicting-outputs

