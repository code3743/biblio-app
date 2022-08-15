import 'package:flutter/material.dart';
import 'package:opac_univalle/themes/app_theme.dart';

class BotonPrimario extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final double? width;

  const BotonPrimario({
    Key? key,
    required this.onPressed,
    required this.child,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: width ?? MediaQuery.of(context).size.width * .6,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: AppTheme.primaryColor,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            onPressed: onPressed,
            child: child));
  }
}
