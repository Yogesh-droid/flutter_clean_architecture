class Params {
  final String url;
  final ApiMethod method;
  final Map<String, dynamic>? body;
  final int? pageNo;
  final int? limit;

  Params(
      {required this.url,
      required this.method,
      this.body,
      this.pageNo,
      this.limit});
}

enum ApiMethod { GET, POST, PUT, DELETE }
