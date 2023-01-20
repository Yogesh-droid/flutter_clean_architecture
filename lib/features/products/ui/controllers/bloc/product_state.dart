part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductFetched extends ProductState {
  // final Exception exception;
  final List<ProductListEntity> productList;
  // final bool noMore;

  const ProductFetched({required this.productList});
}
