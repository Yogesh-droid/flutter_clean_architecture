import 'package:clean_arch_test/core/params.dart';
import 'package:clean_arch_test/core/resource/data_state.dart';
import 'package:clean_arch_test/features/products/domain/entities/product_list_entity.dart';

abstract class ProductListRepo {
  Future<DataState<List<ProductListEntity>>> getProductList(Params params);
}
