import 'package:bloc_api_call/application/class/list_pagination.dart';
import 'package:bloc_api_call/application/class/pagination.dart';
import 'package:bloc_api_call/domain/dataSources/client.dart';
import 'package:bloc_api_call/domain/models/ads_model.dart';
import 'package:bloc_api_call/domain/models/category_item_model.dart';
import 'package:bloc_api_call/domain/models/data.dart';
import 'package:bloc_api_call/domain/models/data_list.dart';
import 'package:bloc_api_call/domain/models/detail_model.dart';
import 'package:bloc_api_call/domain/models/list_model.dart';
import 'package:bloc_api_call/domain/models/pagination_model.dart';
import 'package:retrofit/dio.dart';

class ListRepository {
  Client client;

  ListRepository(this.client);

  Future<HttpResponse<PaginationModel<ListModel>>> getList(
          ListPagination listPagination) =>
      client.getList(listPagination.page, listPagination.ord,
          {'id': listPagination.categoryIds}, listPagination.limit);

  Future<HttpResponse<PaginationModel<AdsModel>>> getAds(
          Pagination adsPagination) =>
      client.getAds(adsPagination.page, adsPagination.limit);

  Future<HttpResponse<DataList<CategoryModel>>> getFilterCategory() =>
      client.getFilterCategory();

  Future<HttpResponse<Data<DetailModel>>> getDetail(int id) =>
      client.getDetail(id);
}
