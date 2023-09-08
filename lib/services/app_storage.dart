import 'package:shared_preferences/shared_preferences.dart';

enum STORARGE_KEY { CHAVE_PESO, CHAVE_ALTURA }

class AppStorageService {

  Future<void> setPeso(double value) async {
    await _setDouble(STORARGE_KEY.CHAVE_PESO.toString(), value);
  }

  Future<double> getPeso() async {
    return _getDouble(STORARGE_KEY.CHAVE_PESO.toString());
  }

  Future<void> setAltura(double value) async {
    await _setDouble(STORARGE_KEY.CHAVE_ALTURA.toString(), value);
  }

  Future<double> getAltura() async {
    return _getDouble(STORARGE_KEY.CHAVE_ALTURA.toString());
  }
  
  Future<void> _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }
}
