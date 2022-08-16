import 'package:flutter/cupertino.dart';

import 'package:opac_univalle/models/opac_models.dart';

import 'package:opac_univalle/shared_preferences/preferences.dart';

import '../utils/capitalizar_nombre.dart';

class EstudianteProvider extends ChangeNotifier {
  late Opac _informacion;

  Opac get informacion => _informacion;

  set informacion(Opac informacion) {
    _informacion = informacion;
    Preferences.nombre = capitalizarNombre(_informacion.nombre);
  }
}
