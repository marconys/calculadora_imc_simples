import 'dart:math';

class Imc {
   int _id;
   double _peso;
   double _altura;

  //Contrutor
  Imc(this._id, this._peso, this._altura);

  //Geter and Seters
  int get id => _id;

  double get peso => _peso;

  set peso(double peso) => _peso = peso;

  double get altura => _altura;

  set altura(double altura) => _altura = altura;

  //Método que calcula e retorna o valor do imc calculado.
  double calcularImc() {
    var imc = _peso / pow(_altura, 2);
    return imc;
  }

  //Método retorna a situação da pessoa cujo o imc está sendo calculado.
  String retornaSituacaoIMC() {
    var imc = calcularImc();
    var situacao = "";
    if (imc < 16) {
      situacao = "Magreza grave";
    } else if (imc >= 16 && imc <= 16.9) {
      situacao = "Magreza moderada";
    } else if (imc >= 17 && imc <= 18.4) {
      situacao = "Magreza leve";
    } else if (imc >= 18.5 && imc <= 24.9) {
      situacao = "Saudável";
    } else if (imc >= 25 && imc <= 29.9) {
      situacao = "Sobrepeso";
    } else if (imc >= 30 && imc <= 34.9) {
      situacao = "Obesidade Grau I";
    } else if (imc >= 35 && imc <= 39.9) {
      situacao = "Obesidade Grau II (severa)";
    } else if (imc >= 40) {
      situacao = "Obesidade Grau III (mórbida)";
    }
    return situacao;
  }

  @override
  String toString() {
    return "O seu IMC é: ${calcularImc().toStringAsFixed(1)} \nE você está com ${retornaSituacaoIMC()}";
  }
}
