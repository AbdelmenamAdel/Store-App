import 'package:flutter/material.dart';
import 'package:store_app/core/services/add_product.dart';
import 'package:store_app/screens/add_product.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/screens/update_product_screen.dart';

class Routes {
  static const String initialRoute = '/'; //! initialRoute
  static const String update = '/update';
  static const String add = '/add';
}

class AppRoutes {
  static Route? generatedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.add:
        return MaterialPageRoute(builder: (_) => const AddProductScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No Found Route'),
            ),
          ),
        );
    }
    return null;
  }
}
