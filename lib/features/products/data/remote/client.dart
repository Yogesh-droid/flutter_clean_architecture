import 'package:http/http.dart' as http;

class Client {
  static final Client instance = Client._internal();
  final http.Client client = http.Client();
  factory Client() {
    return instance;
  }
  Client._internal();
}
