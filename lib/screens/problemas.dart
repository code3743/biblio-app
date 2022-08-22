import 'package:flutter/material.dart';
import 'package:opac_univalle/themes/app_theme.dart';
import 'package:opac_univalle/widgets/boton_primario.dart';

class ProblemasScreen extends StatelessWidget {
  const ProblemasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '¡Qué triste compa!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor),
                ),
                const Text(
                  'Estamos presentando problemas, por favor intenta nuevamente.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset('assets/ardi-sola.png'),
                Column(
                  children: [
                    BotonPrimario(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'check');
                        },
                        child: const Text('Reintentar')),
                    TextButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, 'login');
                        },
                        child: Text(
                          'Ir al Login',
                          style: TextStyle(color: AppTheme.primaryColor),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
