import 'dart:convert';
import 'package:clean_arch_test/features/products/data/models/product_list_model.dart';
import 'package:clean_arch_test/features/products/data/remote/network.dart';
import 'package:clean_arch_test/features/products/domain/entities/product_list_entity.dart';
import 'package:clean_arch_test/core/resource/data_state.dart';
import 'package:clean_arch_test/core/params.dart';
import 'package:clean_arch_test/features/products/domain/repo/product_list_repo.dart';
import 'package:http/http.dart' as http;

class ProductRepoImpl implements ProductListRepo {
  final Network network;

  ProductRepoImpl(this.network);

  @override
  Future<DataState<List<ProductListEntity>>> getProductList(
      Params params) async {
    try {
      http.Response? response = await network.makeRequest(params);
      if (response != null) {
        if (response.statusCode == 200) {
          final value = ProductListModel.fromJson(jsonDecode(response.body));
          return DataSuccess(data: value.products);
        } else {
          return DataErr(error: Exception("Error Fetching Data"));
        }
      } else {
        return DataErr(error: Exception("Error Fetching Data"));
      }
    } on Exception catch (e) {
      return DataErr(error: Exception(e));
    }
  }
}
