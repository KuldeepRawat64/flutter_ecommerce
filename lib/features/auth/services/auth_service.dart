import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/error_handler.dart';
import 'package:flutter_ecommerce_app/constants/global_variables.dart';
import 'package:flutter_ecommerce_app/constants/utils.dart';
import 'package:flutter_ecommerce_app/features/home/screens/home_screen.dart';
import 'package:flutter_ecommerce_app/models/user.dart';
import 'package:flutter_ecommerce_app/providers/user.provider.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Client client = Client();

  // sign up user
  void signUpUser(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');
      Response res = await client.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, 'Account created! Login with the same credentials!');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // sign in user
  void signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      Response res = await client.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(authToken, jsonDecode(res.body)['token']);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
