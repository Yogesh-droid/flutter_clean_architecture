part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object> get props => [];
}

class FetchProductEvent extends ProductEvent {
  final int page;

  const FetchProductEvent({required this.page});
}
