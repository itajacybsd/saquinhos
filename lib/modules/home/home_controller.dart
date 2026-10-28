class HomeController {
  double liquido = 0.0;

  calcularPesoSaquinho(double pesoSaquinho, String peso, String qtdSaquinho) {
    if (peso.isNotEmpty && qtdSaquinho.isNotEmpty) {
      liquido = double.tryParse(peso.replaceAll(',', "."))! -
          (pesoSaquinho * double.tryParse(qtdSaquinho.replaceAll(',', "."))!);
    }
  }
}
