import 'package:clean_arch_test/core/params.dart';
import 'package:clean_arch_test/core/resource/data_state.dart';
import 'package:clean_arch_test/core/usecase.dart';
import 'package:clean_arch_test/features/products/domain/entities/product_list_entity.dart';
import 'package:clean_arch_test/features/products/domain/repo/product_list_repo.dart';

class ProductListUsecase
    extends Usecase<DataState<List<ProductListEntity>>, Params> {
  final ProductListRepo productListRepo;

  ProductListUsecase({required this.productListRepo});
  @override
  Future<DataState<List<ProductListEntity>>> call({Params? params}) {
    return productListRepo.getProductList(params!);
  }
}
