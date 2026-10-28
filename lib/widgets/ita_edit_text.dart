import 'package:flutter/material.dart';

class ItaEditText extends StatelessWidget {
  final String? rotulo;
  final TextEditingController? controlador;
  final FocusNode? focus;

  const ItaEditText({Key? key, this.rotulo, this.controlador, this.focus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final telaAltura = MediaQuery.of(context).size.height;
    // final telaLargura = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(telaAltura * 0.015),
      child: SizedBox(
        width: (telaAltura * 0.80), // largura 340
        child: TextField(
          focusNode: focus,
          controller: controlador,
          style: TextStyle(
            fontSize: (telaAltura * 0.07) / 3, // fonte tamanho 18
          ),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: rotulo,
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
      ),
    );
  }
}
