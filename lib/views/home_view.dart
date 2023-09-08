import 'package:calculadora_imc/models/imc.dart';
import 'package:calculadora_imc/repositories/sqlite/imc_sqlite_repository.dart';
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

  var imcSQLiteRepository = ImcSQLiteRepository();
  late List<Imc> dadosImc = [];

  @override
  void initState() {
    super.initState();
    carregarDadosImc();
  }

  void adicionarImcAoRepositorio(Imc imc) async {
    await imcSQLiteRepository.salvarImc(imc);
    carregarDadosImc();
  }

  void carregarDadosImc() async {
    final listaAtualizada = await imcSQLiteRepository.obterResultadosImc();
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
