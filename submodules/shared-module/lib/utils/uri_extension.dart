extension UriExtension on Uri {
  Uri copyWith({String? scheme,
      String? userInfo,
      String? host,
      int? port,
      String? path,
      Iterable<String>? pathSegments,
      String? query,
      Map<String, dynamic /*String?|Iterable<String>*/>? queryParameters,
      String? fragment}) {
    String? newPath;
    Iterable<String>? newPathSegments;
    if (path == null) {
      if (pathSegments == null) {
        newPath = this.path;
      } else {
        newPathSegments = pathSegments;
      }
    } else {
      newPath = path;
      if(pathSegments != null){
        newPathSegments = pathSegments;
      }
    }
    return Uri(
        scheme: scheme ?? this.scheme,
        userInfo: userInfo ?? this.userInfo,
        host: host ?? this.host,
        port: port ?? this.port,
        path: newPath,
        pathSegments: newPathSegments,
        query: query ?? this.query,
        queryParameters: queryParameters ?? this.queryParameters,
        fragment: fragment ?? this.fragment);
  }
}
