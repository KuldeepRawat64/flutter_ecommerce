import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/global_variables.dart';
import 'package:flutter_ecommerce_app/providers/user.provider.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: GlobalVariables.appBarGradient,
        ),
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: RichText(
          text: TextSpan(
              text: 'Hello ',
              style: const TextStyle(fontSize: 22.0, color: Colors.black),
              children: [
                TextSpan(
                  text: user.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.0,
                      color: Colors.black),
                )
              ]),
        ));
  }
}
