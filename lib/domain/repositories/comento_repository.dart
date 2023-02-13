import 'package:comento_task/application/class/list_pagination.dart';
import 'package:comento_task/application/class/pagination.dart';
import 'package:comento_task/domain/dataSources/client.dart';
import 'package:comento_task/domain/models/ads_model.dart';
import 'package:comento_task/domain/models/category_item_model.dart';
import 'package:comento_task/domain/models/data.dart';
import 'package:comento_task/domain/models/data_list.dart';
import 'package:comento_task/domain/models/detail_model.dart';
import 'package:comento_task/domain/models/list_model.dart';
import 'package:comento_task/domain/models/pagination_model.dart';
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
