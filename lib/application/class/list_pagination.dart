import 'package:comento_task/application/class/pagination.dart';

class ListPagination extends Pagination {
  final List<int> categoryIds;
  final String ord;

  ListPagination({
    required this.categoryIds,
    required this.ord,
    page,
    limit,
  }) : super(page: page, limit: limit);

  @override
  ListPagination copyWith({
    List<int>? categoryIds,
    String? ord,
    int? page,
    int? limit,
  }) {
    return ListPagination(
      categoryIds: categoryIds ?? this.categoryIds,
      ord: ord ?? this.ord,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }
}
