import 'package:flutter/material.dart';

import 'package:opac_univalle/shared_preferences/preferences.dart';
import 'package:opac_univalle/themes/app_theme.dart';
import 'package:opac_univalle/utils/mostrar_alerta.dart';
import 'package:opac_univalle/widgets/widgets.dart';

class PerfilScreen extends StatelessWidget {
  final String fecha;
  final String multa;
  final String librosPrestamo;
  final String historialLibro;

  const PerfilScreen(
      {Key? key,
      required this.fecha,
      required this.multa,
      required this.librosPrestamo,
      required this.historialLibro})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _TextoPrincipal(),
          const _FuncionesPrincipal(),
          BannerInformacion(titulo: 'Multa actual', valor: '\$ $multa'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemInformacion(
                  valor: librosPrestamo,
                  icon: Icons.book_rounded,
                  titulo: 'En prestamo'),
              ItemInformacion(
                  valor: historialLibro,
                  icon: Icons.history_rounded,
                  titulo: 'Historial'),
            ],
          ),
          BannerInformacion(titulo: 'Fecha expiración', valor: fecha),
          BotonPrimario(
              onPressed: () {
                mostrarAlerta(
                    context,
                    AlertaSiNo(
                        title: 'Cerrar sesión',
                        onPressendNo: () => Navigator.pop(context),
                        onPressendSi: () {
                          Preferences.codigo = '';
                          Preferences.nombre = '';
                          Navigator.pushReplacementNamed(context, 'login');
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Estas apunto de cerrar la sesión, ¿deseas continuar?',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        )));
              },
              child: const Text('Cerrar sesión'))
        ],
      ),
    );
  }
}

class _TextoPrincipal extends StatelessWidget {
  const _TextoPrincipal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 60,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(
            'Hemos preparado un resumen de tu cuenta para ti',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class _FuncionesPrincipal extends StatelessWidget {
  const _FuncionesPrincipal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Funciones(
            onTap: () {
              Navigator.pushNamed(context, 'buscador');
            },
            titulo: 'Buscador',
            icon: Icons.search_rounded,
          ),
          Funciones(
            onTap: () {
              Navigator.pushNamed(context, 'favoritos');
            },
            icon: Icons.favorite_rounded,
            titulo: 'Favoritos',
          ),
        ],
      ),
    );
  }
}

class Funciones extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  final String titulo;
  const Funciones({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          padding: const EdgeInsets.all(20),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Icon(
                  icon,
                  size: 45,
                  color: AppTheme.primaryColor,
                )
              ])),
    );
  }
}
