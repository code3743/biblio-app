import 'package:flutter/material.dart';
import 'package:opac_univalle/providers/estudiante_provider.dart';
import 'package:opac_univalle/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'package:opac_univalle/models/opac_models.dart';
import 'package:opac_univalle/services/auth_service.dart';
import 'package:opac_univalle/shared_preferences/preferences.dart';

class CheckLogin extends StatelessWidget {
  const CheckLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authService = Provider.of<AuthService>(context);
    final EstudianteProvider estudianteProvider =
        Provider.of<EstudianteProvider>(context);
    return Scaffold(
        body: FutureBuilder(
      future: authService.obtenerInformacion(),
      builder: (context, AsyncSnapshot<Opac> snapshot) {
        if (snapshot.hasData) {
          estudianteProvider.informacion = snapshot.data!;
          Future.microtask(() => Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(seconds: 0),
                pageBuilder: (_, __, ___) {
                  return const HomeScreen();
                },
              )));

          if (snapshot.hasError) {}
        }
        return Container();
      },
    ));
  }
}
