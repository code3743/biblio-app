import 'package:flutter/material.dart';
import 'package:opac_univalle/themes/app_theme.dart';

class BannerInformacion extends StatelessWidget {
  const BannerInformacion({
    Key? key,
    required this.titulo,
    required this.valor,
  }) : super(key: key);

  final String titulo;
  final String valor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            titulo,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          Text(
            valor,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: AppTheme.primaryColor),
          )
        ],
      ),
    );
  }
}
