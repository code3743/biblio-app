import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:opac_univalle/screens/screens.dart';
import 'package:opac_univalle/providers/estudiante_provider.dart';
import 'package:opac_univalle/services/auth_service.dart';
import 'package:opac_univalle/themes/app_theme.dart';
import 'package:opac_univalle/shared_preferences/preferences.dart';

class CheckLogin extends StatelessWidget {
  const CheckLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authService = Provider.of<AuthService>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: authService.obtenerInformacion(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != 0) {
                final EstudianteProvider estudianteProvider =
                    Provider.of<EstudianteProvider>(context, listen: false);
                estudianteProvider.init(snapshot.data!);
                Future.microtask(() => Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(seconds: 0),
                      pageBuilder: (_, __, ___) {
                        return const HomeScreen();
                      },
                    )));
              } else {
                Future.microtask(() => Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(seconds: 0),
                      pageBuilder: (_, __, ___) {
                        return const LoginScreen();
                      },
                    )));
              }
            }

            if (snapshot.hasError) {
              Future.microtask(() => Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(seconds: 0),
                    pageBuilder: (_, __, ___) {
                      return const LoginScreen();
                    },
                  )));
            }
            return const Loader();
          },
        ));
  }
}

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    Preferences.codigo != ''
                        ? '¡Hola ${Preferences.nombre}! '
                        : '¡Hola Compa!',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor),
                  ),
                  const Text(
                    'Estamos preparando todo para ti',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('Por favor espera un momento',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  CircularProgressIndicator(
                    color: AppTheme.primaryColor,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/ardi.png', fit: BoxFit.cover),
            ),
          )
        ],
      ),
    );
  }
}
