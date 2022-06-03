import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/global_variables.dart';
import 'package:flutter_ecommerce_app/features/auth/screens/auth_screen.dart';
import 'package:flutter_ecommerce_app/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: ((settings) => generateRoute(settings)),
      theme: ThemeData(
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
          scaffoldBackgroundColor: GlobalVariables.backgroundColor),
      title: 'Flutter Demo',
      home: const AuthScreen(),
    );
  }
}
