import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:opac_univalle/screens/screens.dart';
import 'package:opac_univalle/utils/capitalizar_nombre.dart';
import 'package:opac_univalle/providers/providers.dart';
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
            nombre: capitalizarNombre(estudianteProvider.informacion.nombre),
          ),
          Expanded(
              child: Body(
                  index: uiProvider.index,
                  estudianteProvider: estudianteProvider))
        ],
      )),
      bottomNavigationBar: MenuNavegacion(
        child: BottomNavigationBar(
            currentIndex: uiProvider.index,
            selectedItemColor: AppTheme.primaryColor,
            selectedIconTheme: const IconThemeData(size: 30),
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            showUnselectedLabels: true,
            onTap: (index) => uiProvider.index = index,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: 'Inicio'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book), label: 'Prestamo'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history_rounded), label: 'Historial'),
            ]),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final int index;
  final EstudianteProvider estudianteProvider;
  const Body({Key? key, required this.index, required this.estudianteProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return PerfilScreen(
          fecha: estudianteProvider.informacion.fechaExpiracion,
          multa: estudianteProvider.informacion.multa,
          historialLibro: estudianteProvider
              .informacion.historialPrestamos.length
              .toString(),
          librosPrestamo:
              estudianteProvider.informacion.librosPrestados.length.toString(),
        );
      case 1:
        return PrestamoScreen(
          librosPrestados: estudianteProvider.informacion.librosPrestados,
        );
      default:
        return HistorialScreen(
          historalPrestamo: estudianteProvider.informacion.historialPrestamos,
        );
    }
  }
}
