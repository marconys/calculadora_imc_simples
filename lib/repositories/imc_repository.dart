import 'package:calculadora_imc/models/imc.dart';

class ImcRepository {
  final List<Imc> _imcs = [];

  Future<void> adicionarImc(Imc imc) async{
    await Future.delayed(const Duration(microseconds: 100));
    _imcs.add(imc);
  }

  Future<List<Imc>> listarImc() async {
    await Future.delayed(const Duration(microseconds: 100));
    return _imcs;
  }
}
