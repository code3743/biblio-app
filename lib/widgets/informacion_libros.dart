import 'package:flutter/material.dart';

import 'package:opac_univalle/themes/app_theme.dart';

class InformacionLibro extends StatelessWidget {
  final String titulo;
  final String multa;
  final String fecha;
  final String codigo;

  const InformacionLibro({
    Key? key,
    required this.titulo,
    required this.multa,
    required this.fecha,
    required this.codigo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    'Código: $codigo',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600),
                  )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {},
                      child: Text(
                        'Actulizar',
                        style: TextStyle(color: AppTheme.primaryColor),
                      ))
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
                            titulo,
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
                          fecha,
                          style: const TextStyle(
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Multa: $multa',
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
