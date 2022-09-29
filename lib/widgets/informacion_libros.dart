import 'package:flutter/material.dart';
import 'package:opac_univalle/models/opac_models.dart';

import 'package:opac_univalle/themes/app_theme.dart';
import 'package:opac_univalle/utils/mostrar_alerta.dart';
import 'package:opac_univalle/widgets/alerta_si_no.dart';

class InformacionLibro extends StatelessWidget {
  final LibrosPrestado librosPrestado;
  const InformacionLibro({
    Key? key,
    required this.librosPrestado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? fechaActulizada;

    return Container(
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: AppTheme.primaryColor,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    'Código: ${librosPrestado.codigo}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600),
                  )),
                  ActualizarLibro(librosPrestado: librosPrestado)
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Titulo',
                      style: TextStyle(
                          color: AppTheme.primaryColorDark,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Center(
                          child: Text(
                            librosPrestado.titulo,
                            maxLines: 4,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          fechaActulizada ?? librosPrestado.fecha,
                          style: const TextStyle(
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Multa: ${librosPrestado.multa}',
                          style: const TextStyle(
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActualizarLibro extends StatelessWidget {
  const ActualizarLibro({
    Key? key,
    required this.librosPrestado,
  }) : super(key: key);

  final LibrosPrestado librosPrestado;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        onPressed: () {
          mostrarAlerta(
              context,
              AlertaSiNo(
                  title: '¿Deseas actualizar el material?',
                  onPressendSi: () {},
                  onPressendNo: () {
                    Navigator.pop(context);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        librosPrestado.codigo,
                        style: const TextStyle(
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Titulo',
                        style: TextStyle(
                            color: AppTheme.primaryColorDark,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        librosPrestado.titulo,
                        maxLines: 4,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )));
        },
        child: Text(
          'Actulizar',
          style: TextStyle(color: AppTheme.primaryColor),
        ));
  }
}
