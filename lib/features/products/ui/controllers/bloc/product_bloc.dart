import 'package:bloc/bloc.dart';
import 'package:clean_arch_test/core/constants/api_constants.dart';
import 'package:clean_arch_test/core/params.dart';
import 'package:clean_arch_test/features/products/domain/usecases/product_list_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/resource/data_state.dart';
import '../../../domain/entities/product_list_entity.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductListUsecase productListUsecase;
  final List<ProductListEntity> productList = [];
  ProductBloc({required this.productListUsecase}) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is FetchProductEvent) {
        DataState<List<ProductListEntity>> dataState = await productListUsecase(
            params: Params(
                url: "${ApiConstants.baseUrl}/products?limit=10",
                method: ApiMethod.GET));

        if (dataState.data != null) {
          for (var element in dataState.data!) {
            productList.add(element);
          }
        }
      }
      emit(ProductFetched(productList: productList));
    });
  }
}
