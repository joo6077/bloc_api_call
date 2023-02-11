import 'dart:developer';

import 'package:comento_task/domain/models/ads_model.dart';
import 'package:comento_task/domain/models/list_model.dart';
import 'package:comento_task/domain/models/pagination_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi(baseUrl: 'https://problem.comento.kr')
abstract class Client {
  factory Client(Dio dio, {String baseUrl}) = _Client;

  @GET('/api/list')
  Future<HttpResponse<PaginationModel<ListModel>>> getList(
    @Query('page') int page,
    @Query('ord') String ord,
    @Query('category') Map<String, List<int>> category,
    @Query('limit') int limit,
  );

  @GET('/api/ads')
  Future<HttpResponse<PaginationModel<AdsModel>>> getAds(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  // @GET('/api/category')
  // Future<FeedModel> getFilterCategory();

  // @GET('/api/view')
  // Future<FeedModel> getDetail(
  //   @Query('id') int id,
  // );
}
