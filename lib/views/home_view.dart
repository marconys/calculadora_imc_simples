import 'package:calculadora_imc/models/imc.dart';
import 'package:calculadora_imc/repositories/imc_repository.dart';
import 'package:calculadora_imc/views/imc_calculadora_view.dart';
import 'package:calculadora_imc/views/imc_resultado_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController pageController = PageController(initialPage: 0);
  int positionPage = 0;

  var imcRepository = ImcRepository();
  late List<Imc> dadosImc = [];

  void adicionarImcAoRepositorio(Imc imc) async {
    await imcRepository.adicionarImc(imc);
    final listaAtualizada = await imcRepository.listarImc();
    setState(() {
       dadosImc = listaAtualizada;
    });
  }

  void changePage(int index) {
    setState(() {
      positionPage = index;
      pageController.jumpToPage(index);
    });
  }

   @override
  void initState() {
    super.initState();
    dadosImc = []; // Inicialize a lista de dadosImc
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu IMC'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  positionPage = value;
                });
              },
              children: [
                CacluladoraImc(
                  onCalculationComplete: (imc, page) {
                    adicionarImcAoRepositorio(imc);
                    changePage(page);
                  },
                ),
                ImcResultado(
                  dadosImc: dadosImc,
                ),
              ],
            ),
          ),
          BottomNavigationBar(
            onTap: (value) {
              pageController.jumpToPage(value);
            },
            currentIndex: positionPage,
            items: const [
              BottomNavigationBarItem(
                  label: 'Cacluladora IMC', icon: Icon(Icons.calculate)),
              BottomNavigationBarItem(label: 'Meu IMC', icon: Icon(Icons.list)),
            ],
          ),
        ],
      ),
    );
  }
}
