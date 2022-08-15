import 'package:flutter/material.dart';

import 'package:opac_univalle/models/opac_models.dart';
import 'package:opac_univalle/widgets/widgets.dart';

class HistorialScreen extends StatelessWidget {
  final List<HistorialPrestamo> historalPrestamo;

  const HistorialScreen({Key? key, required this.historalPrestamo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return historalPrestamo.isNotEmpty
        ? ListView.builder(
            itemCount: historalPrestamo.length,
            itemBuilder: (_, index) {
              return HistorialLibro(
                  titulo: historalPrestamo[index].titulo,
                  fecha: historalPrestamo[index].fecha,
                  codigo: historalPrestamo[index].codigo);
            },
          )
        : const Vacio();
  }
}
