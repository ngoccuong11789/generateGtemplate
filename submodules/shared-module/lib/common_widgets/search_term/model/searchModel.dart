class SearchModel<T> {
  late final List<T> data;
  late final int totalElement;
  late final int currentPage;
  late final int pageSize;

  SearchModel(
      {required this.data,
      required this.totalElement,
      required this.currentPage,
      required this.pageSize});

  SearchModel.fromData(
    dynamic dataResponse,
  ) {
    data = dataResponse.data;
    totalElement = dataResponse.totalElement;
    currentPage = dataResponse.page;
    pageSize = dataResponse.pageSize;
  }

  SearchModel copyWith(
          {int? totalElement,
          int? currentPage,
          int? pageSize,
          List<T>? data}) =>
      SearchModel(
        data: data ?? this.data,
        totalElement: totalElement ?? this.totalElement,
        currentPage: currentPage ?? this.currentPage,
        pageSize: pageSize ?? this.pageSize,
      );
}
