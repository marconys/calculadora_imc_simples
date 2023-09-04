import 'package:calculadora_imc/models/imc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CacluladoraImc extends StatefulWidget {
  final Function(Imc, int)
      onCalculationComplete; // Modificamos o tipo do parâmetro
  const CacluladoraImc({Key? key, required this.onCalculationComplete})
      : super(key: key);

  @override
  State<CacluladoraImc> createState() => _CacluladoraImcState();
}

class _CacluladoraImcState extends State<CacluladoraImc> {
  var controllerPeso = TextEditingController();
  var controllerAltura = TextEditingController();

  void irParaResultadoImc(BuildContext context) {
    Imc imcResult = Imc(
        double.parse(controllerPeso.text), double.parse(controllerAltura.text));
    widget.onCalculationComplete(imcResult, 1); // Navega para a próxima página
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, right: 10, left: 10),
          child: Column(
            children: [
              Card(child: Image.asset('lib/images/imc.png')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    controllerPeso.text = '';
                    controllerAltura.text = '';
                    showDialog(
                        context: context,
                        builder: (BuildContext bc) {
                          return AlertDialog(
                            title: const Text('Calcular IMC'),
                            content: Wrap(
                              children: [
                                TextField(
                                  controller: controllerPeso,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9 .]')),
                                  ],
                                  decoration: const InputDecoration(
                                    labelText: 'Peso Kg',
                                    hintText: '75.0',
                                  ),
                                ),
                                TextField(
                                  controller: controllerAltura,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9 .]')),
                                  ],
                                  decoration: const InputDecoration(
                                    labelText: 'Altura cm',
                                    hintText: '1.75',
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancelar')),
                              TextButton(
                                  onPressed: () {
                                    if (controllerPeso.text.isEmpty ||
                                        controllerAltura.text.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Todos os campos são obrigatórios.'),
                                        ),
                                      );
                                    } else {
                                      irParaResultadoImc(context);
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text('Calcular')),
                            ],
                          );
                        });
                  },
                  child: const Text(
                    'Calcule o seu IMC',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
