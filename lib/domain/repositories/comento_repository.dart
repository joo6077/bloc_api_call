import 'package:comento_task/application/class/list_pagination.dart';
import 'package:comento_task/application/class/pagination.dart';
import 'package:comento_task/domain/dataSources/comento_remote_data_source.dart';
import 'package:comento_task/domain/models/ads_model.dart';
import 'package:comento_task/domain/models/category_item_model.dart';
import 'package:comento_task/domain/models/data.dart';
import 'package:comento_task/domain/models/data_list.dart';
import 'package:comento_task/domain/models/detail_model.dart';
import 'package:comento_task/domain/models/list_model.dart';
import 'package:comento_task/domain/models/pagination_model.dart';
import 'package:retrofit/dio.dart';

class ListRepository {
  ComentoRemoteDataSource comentoRemoteDataSource;

  ListRepository(this.comentoRemoteDataSource);

  Future<HttpResponse<PaginationModel<ListModel>>> getList(
          ListPagination listPagination) =>
      comentoRemoteDataSource.getList(listPagination.page, listPagination.limit,
          listPagination.ord, {'id': listPagination.categoryIds});

  Future<HttpResponse<PaginationModel<AdsModel>>> getAds(
          Pagination adsPagination) =>
      comentoRemoteDataSource.getAds(adsPagination.page, adsPagination.limit);

  Future<HttpResponse<DataList<CategoryModel>>> getFilterCategory() =>
      comentoRemoteDataSource.getFilterCategory();

  Future<HttpResponse<Data<DetailModel>>> getDetail(int id) =>
      comentoRemoteDataSource.getDetail(id);
}
