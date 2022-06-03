import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/common/widgets/custom_textfield.dart';
import 'package:flutter_ecommerce_app/constants/global_variables.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
              title: const Text('Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            if (_auth == Auth.signup)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        hintText: 'Name',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      CustomButton(text: 'Sign Up', onPressed: () {})
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
              title: const Text('Sign-In',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            if (_auth == Auth.signin)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      CustomButton(text: 'Log In', onPressed: () {})
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
