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
          {int page = 1,
          int limit = 10,
          String ord = 'asc',
          Map<String, List<int>> category = const {'id': []}}) =>
      comentoRemoteDataSource.getList(page, limit, ord, category);

  Future<HttpResponse<PaginationModel<AdsModel>>> getAds(
          {int page = 1, int limit = 10}) =>
      comentoRemoteDataSource.getAds(page, limit);

  Future<HttpResponse<DataList<CategoryModel>>> getFilterCategory() =>
      comentoRemoteDataSource.getFilterCategory();

  Future<HttpResponse<Data<DetailModel>>> getDetail(int id) =>
      comentoRemoteDataSource.getDetail(id);
}
