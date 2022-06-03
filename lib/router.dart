import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/auth/screens/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const AuthScreen());
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
