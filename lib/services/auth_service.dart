import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:opac_univalle/models/opac_models.dart';
import 'package:opac_univalle/shared_preferences/preferences.dart';

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'api-univalle.herokuapp.com';

  Future<dynamic> obtenerInformacion() async {
    String codigo = Preferences.codigo!;

    if (codigo != '') {
      final Uri url = Uri.https(_baseUrl, '/api/opac', {'codigo': codigo});

      try {
        final resp = await http.get(url);

        if (resp.statusCode == 200) {
          return opacFromJson(resp.body);
        }
        throw 'Estamos presentando fallas';
      } catch (e) {
        rethrow;
      }
    }
    return 0;
  }

  Future<Opac> autenticar(String codigo, bool saveCode) async {
    final Uri url = Uri.https(_baseUrl, '/api/opac', {'codigo': codigo});
    try {
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        if (saveCode) {
          Preferences.codigo = codigo;
        }
        return opacFromJson(resp.body);
      } else if (resp.statusCode == 400) {
        throw '¿Todo bien?, verifica tu código y vuelve a intentarlo';
      } else {
        throw 'Estamos presentando problemas, por favor vuelve a intentarlo.';
      }
    } catch (e) {
      rethrow;
    }
  }
}
