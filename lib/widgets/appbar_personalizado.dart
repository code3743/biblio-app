import 'package:flutter/material.dart';

class AppBarPersonalizado extends StatelessWidget {
  final String nombre;
  const AppBarPersonalizado({
    Key? key,
    required this.nombre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration(),
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hola,',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        Text(
                          nombre,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 26,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          ' 👋',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/Logo.png',
            height: 60,
          )
        ],
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
          blurRadius: 2,
          offset: const Offset(0, 4),
          color: Colors.grey.withOpacity(.4))
    ]);
  }
}
