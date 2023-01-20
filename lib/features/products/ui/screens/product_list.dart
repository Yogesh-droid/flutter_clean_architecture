import 'package:clean_arch_test/core/constants/strings.dart';
import 'package:clean_arch_test/features/products/domain/entities/product_list_entity.dart';
import 'package:clean_arch_test/features/products/ui/widget/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/bloc/product_bloc.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late ProductBloc productBloc;

  @override
  void initState() {
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(FetchProductEvent(page: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kProductPageTitle),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductFetched) {
            return ListView(
              children:
                  state.productList.map((e) => getProductList(e)).toList(),
            );
          } else {
            return const SizedBox(
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }

  Widget getProductList(ProductListEntity e) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ProductTile(productListEntity: e),
    );
  }
}
