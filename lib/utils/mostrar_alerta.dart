import 'package:flutter/material.dart';

void mostrarAlerta(BuildContext context, Widget child) {
  showDialog(
      barrierDismissible: false, context: context, builder: (context) => child);
}
