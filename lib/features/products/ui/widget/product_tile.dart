import 'package:clean_arch_test/features/products/domain/entities/product_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.productListEntity})
      : super(key: key);
  final ProductListEntity productListEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(productListEntity.thumbnail ?? '',
            width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
        Text(productListEntity.title ?? ''),
        Text(productListEntity.discountPercentage.toString())
      ],
    );
  }
}
