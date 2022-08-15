import 'package:flutter/material.dart';
import 'package:opac_univalle/themes/app_theme.dart';

class BotonAyuda extends StatelessWidget {
  final Function()? onPressed;
  const BotonAyuda({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppTheme.primaryColor,
      onPressed: onPressed,
      child: const Icon(Icons.question_mark_rounded),
    );
  }
}
