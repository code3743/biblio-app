import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:opac_univalle/providers/providers.dart';
import 'package:opac_univalle/routers/app_router.dart';
import 'package:opac_univalle/services/auth_service.dart';
import 'package:opac_univalle/shared_preferences/preferences.dart';
import 'package:opac_univalle/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const MyStateApp());
}

class MyStateApp extends StatelessWidget {
  const MyStateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => UiProvider()),
        ChangeNotifierProvider(create: (context) => EstudianteProvider())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OPAC Univalle',
      initialRoute: AppRouter.initialRouter,
      routes: AppRouter.routes,
      theme: AppTheme.appThemeLight,
    );
  }
}
