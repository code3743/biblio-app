import 'package:flutter/material.dart';
import 'package:opac_univalle/screens/screens.dart';

class AppRouter {
  AppRouter._();

  static String initialRouter = 'check';
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    'login': (_) => const LoginScreen(),
    'home': (_) => const HomeScreen(),
    'check': (_) => const CheckLogin(),
  };
}
