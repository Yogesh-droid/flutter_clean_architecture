import 'package:clean_arch_test/core/routes.dart';
import 'package:clean_arch_test/features/products/data/remote/network.dart';
import 'package:clean_arch_test/features/products/data/repo/product_repo_impl.dart';
import 'package:clean_arch_test/features/products/domain/usecases/product_list_usecase.dart';
import 'package:clean_arch_test/features/products/ui/controllers/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(
              productListUsecase: ProductListUsecase(
                  productListRepo: ProductRepoImpl(Network()))),
        ),
      ],
      child: MaterialApp(
        title: 'Clean Arc Test',
        theme:
            ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
        initialRoute: Routes.productListRoute,
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}
