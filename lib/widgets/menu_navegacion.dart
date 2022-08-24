import 'package:flutter/material.dart';

class MenuNavegacion extends StatelessWidget {
  final Widget child;
  const MenuNavegacion({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: double.infinity,
        decoration: boxDecoration(),
        clipBehavior: Clip.antiAlias,
        child: child);
  }

  BoxDecoration boxDecoration() {
    return const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), topLeft: Radius.circular(40)));
  }
}
