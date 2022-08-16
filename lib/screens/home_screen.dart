import 'package:flutter/material.dart';
import 'package:opac_univalle/shared_preferences/preferences.dart';
import 'package:opac_univalle/utils/capitalizar_nombre.dart';
import 'package:provider/provider.dart';

import 'package:opac_univalle/providers/providers.dart';
import 'package:opac_univalle/screens/historial_screen.dart';
import 'package:opac_univalle/screens/perfil_screen.dart';
import 'package:opac_univalle/screens/prestamo_screen.dart';
import 'package:opac_univalle/themes/app_theme.dart';
import 'package:opac_univalle/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UiProvider uiProvider = Provider.of<UiProvider>(context);
    final EstudianteProvider estudianteProvider =
        Provider.of<EstudianteProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AppBarPersonalizado(
            nombre: Preferences.codigo != ''
                ? Preferences.nombre!
                : capitalizarNombre(estudianteProvider.informacion.nombre),
          ),
          Expanded(
              child: uiProvider.index == 0
                  ? PerfilScreen(
                      fecha: estudianteProvider.informacion.fechaExpiracion,
                      multa: estudianteProvider.informacion.multa,
                      historialLibro: estudianteProvider
                          .informacion.historialPrestamos.length
                          .toString(),
                      librosPrestamo: estudianteProvider
                          .informacion.librosPrestados.length
                          .toString(),
                    )
                  : uiProvider.index == 1
                      ? PrestamoScreen(
                          librosPrestados:
                              estudianteProvider.informacion.librosPrestados,
                        )
                      : HistorialScreen(
                          historalPrestamo:
                              estudianteProvider.informacion.historialPrestamos,
                        )),
        ],
      )),
      bottomNavigationBar: MenuNavegacion(
        child: BottomNavigationBar(
            currentIndex: uiProvider.index,
            selectedItemColor: AppTheme.primaryColor,
            selectedIconTheme: const IconThemeData(size: 30),
            onTap: (index) => uiProvider.index = index,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: 'Inicio'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book), label: 'En prestamo'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history_rounded), label: 'Historial')
            ]),
      ),
    );
  }
}
