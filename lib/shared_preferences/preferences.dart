import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static bool? get saveCode => _preferences.getBool('saveCode');
  static set saveCode(bool? code) {
    _preferences.setBool('saveCode', code!);
  }

  static String? get codigo => _preferences.getString('codigo');
  static set codigo(String? valor) {
    _preferences.setString('codigo', valor!);
  }

  static String? get nombre => _preferences.getString('nombre');
  static set nombre(String? valor) {
    _preferences.setString('nombre', valor!);
  }
}
