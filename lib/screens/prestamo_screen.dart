import 'package:flutter/material.dart';

import 'package:opac_univalle/models/opac_models.dart';
import 'package:opac_univalle/providers/estudiante_provider.dart';

import 'package:opac_univalle/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PrestamoScreen extends StatelessWidget {
  final List<LibrosPrestado> librosPrestados;
  const PrestamoScreen({Key? key, required this.librosPrestados})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EstudianteProvider estudianteProvider =
        Provider.of<EstudianteProvider>(context);

    if (librosPrestados.isNotEmpty) {
      return Column(
        children: [
          BotonPrimario(
              onPressed: !estudianteProvider.actualizarTodoLoad ? () {} : null,
              child: const Text('Actualizar todo')),
          Expanded(
            child: ListView.builder(
              itemCount: librosPrestados.length,
              itemBuilder: (context, index) {
                return InformacionLibro(
                    titulo: librosPrestados[index].titulo,
                    multa: librosPrestados[index].multa,
                    fecha: librosPrestados[index].fecha,
                    codigo: librosPrestados[index].codigo);
              },
            ),
          ),
        ],
      );
    } else {
      return const Vacio();
    }
  }
}
