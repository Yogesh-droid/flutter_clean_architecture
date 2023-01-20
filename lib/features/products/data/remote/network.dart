import 'package:clean_arch_test/core/params.dart';
import 'package:clean_arch_test/features/products/data/remote/client.dart';
import 'package:http/http.dart' as http;

class Network {
  final http.Client client = Client.instance.client;
  // Future<http.Response> makeGetRequest(Params params) async {
  //   http.Response response = await client.get(Uri.parse(params.url));
  //   return response;
  // }

  Future<http.Response?> makeRequest(Params params) async {
    http.Response response;
    switch (params.method) {
      case ApiMethod.GET:
        response = await client.get(Uri.parse(params.url));
        return response;
      default:
        return null;
    }
  }
}
