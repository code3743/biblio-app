import 'package:flutter/material.dart';

class BuscadorScreen extends StatelessWidget {
  const BuscadorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscador'),
        centerTitle: true,
      ),
    );
  }
}
