import 'package:comento_task/domain/models/ads_model.dart';
import 'package:comento_task/domain/models/list_model.dart';
import 'package:retrofit/retrofit.dart';

import 'package:comento_task/domain/api/client.dart';
import 'package:comento_task/domain/models/pagination_model.dart';

class ComentoRemoteDataSource {
  final Client client;

  ComentoRemoteDataSource({
    required this.client,
  });

  Future<HttpResponse<PaginationModel<ListModel>>> getList(
      int page, int limit, String ord, Map<String, List<int>> category) {
    return client.getList(page, ord, category, limit);
  }

  Future<HttpResponse<PaginationModel<AdsModel>>> getAds(int page, int limit) {
    return client.getAds(page, limit);
  }
}
