import 'package:flutter/material.dart';
import 'package:opac_univalle/themes/app_theme.dart';

class AlertaSiNo extends StatelessWidget {
  final String title;
  final Widget child;
  final Function()? onPressendSi;
  final Function()? onPressendNo;
  const AlertaSiNo(
      {Key? key,
      required this.title,
      required this.child,
      required this.onPressendSi,
      required this.onPressendNo})
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
            onPressed: onPressendSi,
            child: Text(
              'Si',
              style: TextStyle(
                  color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
            )),
        TextButton(
            onPressed: onPressendNo,
            child: Text(
              'No',
              style: TextStyle(
                  color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
