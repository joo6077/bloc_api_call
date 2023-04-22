import 'package:bloc_api_call/domain/models/ads_model.dart';
import 'package:bloc_api_call/domain/models/category_item_model.dart';
import 'package:bloc_api_call/domain/models/data_list.dart';
import 'package:bloc_api_call/domain/models/data.dart';
import 'package:bloc_api_call/domain/models/detail_model.dart';
import 'package:bloc_api_call/domain/models/list_model.dart';
import 'package:bloc_api_call/domain/models/pagination_model.dart';
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

  @GET('/api/category')
  Future<HttpResponse<DataList<CategoryModel>>> getFilterCategory();

  @GET('/api/view')
  Future<HttpResponse<Data<DetailModel>>> getDetail(
    @Query('id') int id,
  );
}
