import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/bottom_bar.dart';
import 'package:flutter_ecommerce_app/features/admin/screens/add_product_screen.dart';
import 'package:flutter_ecommerce_app/features/auth/screens/auth_screen.dart';
import 'package:flutter_ecommerce_app/features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const AddProductScreen());
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const AuthScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const BottomBar());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const HomeScreen());
    default:
      return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Page not found!'),
                ),
              ));
  }
}
