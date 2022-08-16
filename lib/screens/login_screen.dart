import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import 'package:opac_univalle/providers/providers.dart';
import 'package:opac_univalle/services/auth_service.dart';
import 'package:opac_univalle/themes/app_theme.dart';
import 'package:opac_univalle/utils/mostrar_alerta.dart';
import 'package:opac_univalle/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const _TextoCabecera(),
          Positioned(
            right: 30,
            top: 10,
            child: SafeArea(
              child: Image.asset('assets/Logo.png'),
            ),
          ),
          ChangeNotifierProvider(
              create: (_) => LoginProvider(), child: const _Formulario()),
        ],
      ),
      floatingActionButton: BotonAyuda(onPressed: () {
        mostrarAlerta(
            context,
            Alerta(
                title: '¡Hola compa!',
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Lleva en tu bolsillo la información del sistema OPAC. De manera fácil llevaras un control de tus prestamos, multas y renovaciones.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )));
      }),
    );
  }
}

class _TextoCabecera extends StatelessWidget {
  const _TextoCabecera({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 190,
        height: 190,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              height: 10,
            ),
            Text(
              'OPAC',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Univalle',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Formulario extends StatelessWidget {
  const _Formulario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void redireccionar(String ruta) {
      Navigator.pushReplacementNamed(context, ruta);
    }

    final loginProvider = Provider.of<LoginProvider>(context);
    final uiProvider = Provider.of<UiProvider>(context);

    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: loginProvider.formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/ardi-sola.png',
              fit: BoxFit.contain,
            ),
            TextFormPersonalizado(
              validator: (value) {
                RegExp regExp = RegExp(r'^[0-9]{5,16}$');
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El código no es valido';
              },
              onChanged: (value) => loginProvider.codigo = value,
              enabled: !loginProvider.isLoading,
              hintText: 'Código',
            ),
            BotonPrimario(
              onPressed: loginProvider.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      if (!loginProvider.isValidForm()) return;
                      loginProvider.isLoading = true;
                      final AuthService authService =
                          Provider.of<AuthService>(context, listen: false);
                      final EstudianteProvider estudianteProvider =
                          Provider.of<EstudianteProvider>(context,
                              listen: false);
                      try {
                        estudianteProvider.informacion =
                            await authService.autenticar(
                                loginProvider.codigo, uiProvider.saveCode);
                        redireccionar('home');
                      } catch (error) {
                        loginProvider.isLoading = false;
                        mostrarAlerta(
                            context,
                            Alerta(
                                title: '¡Upps!',
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      error.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Icon(
                                      Icons.error_outline_rounded,
                                      size: 50,
                                      color: AppTheme.primaryColor,
                                    )
                                  ],
                                )));
                      }
                    },
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Text(!loginProvider.isLoading ? 'Consultar' : 'Espere...'),
                  if (loginProvider.isLoading)
                    CupertinoActivityIndicator(
                      color: AppTheme.primaryColor,
                    )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '¿Recordar código?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: uiProvider.saveCode,
                  onChanged: !loginProvider.isLoading
                      ? (value) => uiProvider.saveCode = value
                      : null,
                  activeColor: AppTheme.primaryColor,
                  activeTrackColor: AppTheme.primaruOpacityColor,
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
