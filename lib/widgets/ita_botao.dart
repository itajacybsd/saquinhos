import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  late var onPress;
  late var rotulo;
  late var color;
  Botao({required this.onPress, this.rotulo, this.color});

  @override
  Widget build(BuildContext context) {
    final telaAltura = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        rotulo,
        style: TextStyle(
          fontSize: (telaAltura * 0.08) / 3, // equivalente a fonte tamanho 20
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
    );
  }
}
