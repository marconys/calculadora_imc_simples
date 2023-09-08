import 'package:calculadora_imc/models/imc.dart';
import 'package:calculadora_imc/repositories/sqlite/sqlite_database.dart';

class ImcSQLiteRepository {
  Future<List<Imc>> obterResultadosImc() async {
    List<Imc> imcs = [];
    var db = await SqliteDataBase().oberDatabase();
    var results = await db.rawQuery("SELECT id, peso, altura FROM imc");
    for (var result in results) {
      imcs.add(Imc(
          int.parse(result["id"].toString()),
          double.parse(result["peso"].toString()),
          double.parse(result["altura"].toString())));
    }
    return imcs;
  }

  Future<void> salvarImc(Imc imc) async {
    var db = await SqliteDataBase().oberDatabase();
    await db.rawInsert(
        'INSERT INTO imc (peso, altura) values(?, ?)', [imc.peso, imc.altura]);
  }
}
