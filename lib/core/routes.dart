import 'package:clean_arch_test/features/products/ui/screens/product_list.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String productListRoute = '/';

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case productListRoute:
        return MaterialPageRoute(builder: (context) => ProductList());
    }
  }
}
