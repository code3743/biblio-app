import 'package:flutter/material.dart';
import '/config/router/app_router.dart';

class BiblioApp extends StatelessWidget {
  const BiblioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiblioApp',
      debugShowCheckedModeBanner: true,
      initialRoute: AppRouter.initialRouter,
      routes: AppRouter.routes,
    );
  }
}
