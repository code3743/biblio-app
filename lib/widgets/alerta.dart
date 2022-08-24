import 'package:flutter/material.dart';
import 'package:opac_univalle/themes/app_theme.dart';

class Alerta extends StatelessWidget {
  final String title;
  final Widget child;
  const Alerta({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppTheme.primaryColor, fontWeight: FontWeight.w500),
      ),
      content: child,
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Ok',
              style: TextStyle(
                  color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
