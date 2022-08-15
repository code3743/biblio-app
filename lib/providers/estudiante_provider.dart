import 'package:flutter/cupertino.dart';

import 'package:opac_univalle/models/opac_models.dart';

import 'package:opac_univalle/shared_preferences/preferences.dart';

class EstudianteProvider extends ChangeNotifier {
  late Opac _informacion;

  Opac get informacion => _informacion;

  set informacion(Opac informacion) {
    _informacion = informacion;
    Preferences.nombre = _informacion.nombre;
    notifyListeners();
  }
}
