import 'package:flutter/material.dart';
import 'package:opac_univalle/themes/app_theme.dart';

class ItemInformacion extends StatelessWidget {
  const ItemInformacion({
    Key? key,
    required this.valor,
    required this.icon,
    required this.titulo,
  }) : super(key: key);

  final String valor;
  final IconData icon;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                valor,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: AppTheme.primaryColor),
              ),
              Icon(
                icon,
                size: 45,
                color: AppTheme.primaryColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
