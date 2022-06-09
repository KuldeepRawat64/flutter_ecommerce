import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/global_variables.dart';
import 'package:flutter_ecommerce_app/features/loader/screens/loader_screen.dart';
import 'package:flutter_ecommerce_app/providers/user.provider.dart';
import 'package:flutter_ecommerce_app/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: ((settings) => generateRoute(settings)),
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
                primary: GlobalVariables.secondaryColor),
            appBarTheme: const AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
            scaffoldBackgroundColor: GlobalVariables.backgroundColor),
        title: 'Flutter E-commerce',
        home: const LoaderScreen());
  }
}
