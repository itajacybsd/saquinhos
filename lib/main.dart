//!    VERSÃO COM RESPONSIVIDADE
//!   PARA CELULARES E TABLETS
//! pasta GAlle não é exibida, veja em settings/exclude
//!  versão 3.0
//* alterado em 28/10/26
// instalado fvm
// e configurado para a versao 3.24.1 do flutter
// alterado o valor de 0,22 para 0,11 a pedido da Paola


//?  Nesta versão os campos decimais são digitados com ,(vírgula)
//*

import 'package:flutter/material.dart';
import 'package:saquinhos/modules/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saquinhos v4.0s',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Saquinhos - Expedição - v4.0'),
    );
  }
}




/*
Problemas resolvidos:
-  Estouro de tela, devido a espaçamento entre os campos quando era mostrado o teclado
  e o teclado ficava sobre os botões.
  solução: envolver o Column() com um SingleChildScrollView()

- teclado numérico somente, não permitindo a entrada de casas decimais
  solução: substituição do TextInputType.number, por TextInputType.numberWithOptions(decimal: true)

- Exibir o resultado do Peso Liquido com 2 casas decimais somente
  solução: 'Peso Liquido.: ${liquido.toStringAsFixed(2)}'

- Fazer 4 telas para os cálculos de saquinhos 0,15  0,22  0,28 e 0,70
  solução: Acessei o flutter.dev e segui o exemplo do Tabview e TabBarView

- Exibir os botões Calcular e Limpar na mesma linha, para não ter que rolar a tela para clicar em Limpar
  solução:  Envolvi ambos os botões em uma Row() e utilizei a propriedade
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, para distribuir os botões na linha

*/

// - Após "Limpar", fazer com que o cursor apareça no primeiro campo da tela, no campo Peso Bruto,
//   pois o cursor fica no último campo que foi utilizado
//    solução:  Matheus usou o FocusNode

// - Como seria para substituir o "." por ","
//  solução:  Matheus usou no BotaoCalcular  pesoTabSaquinho = pesoTabSaquinho.replaceAll(',', '.');

//- Como Limpar o campos quando passar de uma tab para outra
//  solução:  utilizando o addListener()  da tab
