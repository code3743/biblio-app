import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ActualizarService extends ChangeNotifier {
  final String _baseUrl = 'api-univalle.herokuapp.com';

  Future autenticar(String codigo, String index) async {
    final Uri url =
        Uri.https(_baseUrl, '/api/opac/actualizar/$index', {'codigo': codigo});
    try {
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        return '';
      }
      throw 'Estamos presentando problemas, por favor vuelve a intentarlo.';
    } catch (e) {
      rethrow;
    }
  }
}
