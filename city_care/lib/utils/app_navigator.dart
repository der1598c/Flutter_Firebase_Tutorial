
import 'package:city_care/pages/login_page.dart';
import 'package:city_care/pages/register_page.dart';
import 'package:city_care/view_models/login_view_model.dart';
import 'package:city_care/view_models/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppNavigator {

  static Future<bool> navigateToLoginPage(BuildContext context) async {
    return await Navigator.push(context, MaterialPageRoute(
      builder: (context) =>
      ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: LoginPage(),
      ), fullscreenDialog: true
    )
    );
  }

  static Future<bool> navigateToRegisterPage(BuildContext context) async {
    return await Navigator.push(context, MaterialPageRoute(
      builder: (context) => 
      ChangeNotifierProvider(
        create: (context) => RegisterViewModel(),
        child: RegisterPage(),
      ), fullscreenDialog: true 
    ));
  }

}