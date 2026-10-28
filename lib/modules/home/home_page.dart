import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:saquinhos/modules/home/home_controller.dart';
import 'package:saquinhos/widgets/ita_botao.dart';
import 'package:saquinhos/widgets/ita_edit_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = <Tab>[
    Tab(text: '0,11'),
    Tab(text: '0,15'),
    Tab(text: '0,28'),
    Tab(text: '0,70'),
  ];

  late TabController tabController;

  final TextEditingController controladorPesoBruto = TextEditingController();
  final TextEditingController controladorQtdeSaquinho = TextEditingController();
  late FocusNode focusCtrl1;

  HomeController homeController = HomeController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    focusCtrl1 = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final tela = MediaQuery.of(context);
    final telaInteira = tela.size;
    final telaAltura = telaInteira.height;
    //final telaLargura = telaInteira.width;

    // debugPrint('Inteira '+telaInteira.toString());
    // debugPrint('Altura '+telaAltura.toString());
    // debugPrint('Largura '+telaLargura.toString());
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            _limpar();
          }
        });
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(widget.title),
            bottom: TabBar(
              controller: tabController,
              tabs: tabs,
              //indicatorColor: Colors.red,
              //indicatorWeight: 5.0,
              automaticIndicatorColorAdjustment: false,
              unselectedLabelColor: Colors.yellow,
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: (telaAltura * 0.07) / 3,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              labelStyle: TextStyle(
                fontSize: (telaAltura * 0.10) / 3,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              indicator: const BoxDecoration(color: Colors.red),
            ),
          ),
          body: TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            children: [
              tabSaquinho('0,11'),
              tabSaquinho('0,15'),
              tabSaquinho('0,28'),
              tabSaquinho('0,70'),
            ],
          ),
        );
      }),
    );
  }

  SingleChildScrollView tabSaquinho(String pesoTabSaquinho) {
    return SingleChildScrollView(
      child: Builder(builder: (context) {
        final telaAltura = MediaQuery.of(context).size.height;

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: (telaAltura * 0.015)),
              ItaEditText(
                focus: focusCtrl1,
                controlador: controladorPesoBruto,
                rotulo: 'Peso Bruto (em gramas)',
              ),
              ItaEditText(
                  controlador: controladorQtdeSaquinho,
                  rotulo: 'Quantidade de Saquinhos'),
              SizedBox(height: (telaAltura * 0.020)),
              Text(
                'Peso Líquido = Peso Bruto - (Qtde Saquinhos * $pesoTabSaquinho)',
                style: TextStyle(
                  fontSize: (telaAltura * 0.044) / 3, // fonte tamanho 12
                ),
              ),
              SizedBox(height: (telaAltura * 0.015)),
              Text(
                'Peso Líquido.: ${homeController.liquido.toStringAsFixed(2).replaceAll('.', ',')}',
                style: TextStyle(
                  fontSize: (telaAltura * 0.09) / 3, // fonte tamanho 24
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: (telaAltura * 0.015)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Botao(
                    onPress: () {
                      _limpar();
                      FocusScope.of(context).requestFocus(focusCtrl1);
                    },
                    rotulo: 'Limpar',
                    color: Colors.green,
                  ),
                  Botao(
                    onPress: () {
                      pesoTabSaquinho = pesoTabSaquinho.replaceAll(',', '.');
                      // debugPrint(pesoTabSaquinho);
                      setState(() {
                        homeController.calcularPesoSaquinho(
                            double.tryParse(pesoTabSaquinho)!,
                            controladorPesoBruto.text,
                            controladorQtdeSaquinho.text);
                      });
                    },
                    rotulo: 'Calcular',
                    color: Colors.blue,
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  _limpar() {
    setState(() {
      controladorPesoBruto.clear();
      controladorQtdeSaquinho.clear();
      homeController.liquido = 0;
    });
  }
}
