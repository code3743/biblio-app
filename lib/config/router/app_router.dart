import 'package:flutter/material.dart' show Widget, BuildContext, WidgetBuilder;
import '/ui/screens/screens.dart';
import 'app_router_name.dart';

class AppRouter {
  static String initialRouter = AppRouteName.introduccion.name;
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    AppRouteName.introduccion.name: (context) => const IntroduccionScreen(),
    AppRouteName.inicio.name: (context) => const HomeScreen(),
    AppRouteName.detalles.name: (context) => const DetalleLibroScreen(),
  };
}
