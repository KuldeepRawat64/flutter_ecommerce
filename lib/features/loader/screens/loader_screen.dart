import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/bottom_bar.dart';
import 'package:flutter_ecommerce_app/features/admin/screens/admin_screen.dart';
import 'package:provider/provider.dart';

import '../../../providers/user.provider.dart';
import '../../auth/screens/auth_screen.dart';
import '../../auth/services/auth_service.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({Key? key}) : super(key: key);

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<UserProvider>(context).user.token.isNotEmpty
        ? Provider.of<UserProvider>(context).user.type == 'user'
            ? const BottomBar()
            : const AdminScreen()
        : const AuthScreen();
  }
}
