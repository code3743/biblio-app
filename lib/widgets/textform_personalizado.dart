import 'package:flutter/material.dart';
import 'package:opac_univalle/themes/app_theme.dart';

class TextFormPersonalizado extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final double? width;
  final bool enabled;
  final String? initialValue;
  const TextFormPersonalizado({
    Key? key,
    required this.hintText,
    this.validator,
    this.onChanged,
    required this.enabled,
    this.width,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: width ?? MediaQuery.of(context).size.width * .6,
        child: TextFormField(
          enabled: enabled,
          autocorrect: false,
          validator: validator,
          onChanged: onChanged,
          initialValue: initialValue,
          cursorColor: AppTheme.primaryColorDark,
          textAlign: TextAlign.center,
          decoration: InputDecoration(hintText: hintText),
        ));
  }
}
