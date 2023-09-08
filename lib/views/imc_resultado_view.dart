import 'package:calculadora_imc/models/imc.dart';
import 'package:flutter/material.dart';

class ImcResultado extends StatefulWidget {
  final List<Imc> dadosImc;
  const ImcResultado({Key? key, required this.dadosImc}) : super(key: key);

  @override
  State<ImcResultado> createState() => _ImcResultadoState();
}

class _ImcResultadoState extends State<ImcResultado> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: ListView.builder(
            itemCount: widget.dadosImc.length,
            itemBuilder: (BuildContext bc, int index) {
              var imc = widget.dadosImc[index];
              return ListTile(
                title: Text(imc.toString()),
              );
            }),
      ),
    );
  }
}
