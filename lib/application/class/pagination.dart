class Pagination {
  final int page;
  final int limit;

  Pagination({
    required this.page,
    required this.limit,
  });

  Pagination copyWith({
    int? page,
    int? limit,
  }) {
    return Pagination(
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }
}
