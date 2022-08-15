import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:opac_univalle/themes/app_theme.dart';

class Vacio extends StatelessWidget {
  const Vacio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '¡Upps, no hay nada aquí!',
              style: TextStyle(
                  fontSize: 22,
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            Lottie.asset('assets/vacio.json',
                height: MediaQuery.of(context).size.height * .45),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '“Una bliblioteca no es un conjunto de libros leídos, sino una compañía, un refugio y un proyecto de vida.”\nArturo Pérez-Reverte.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
