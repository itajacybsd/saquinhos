import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  late final void Function()? onPress;
  late final String rotulo;
  late final Color? color;
  // ignore: prefer_const_constructors_in_immutables
  Botao({Key? key, required this.onPress, required this.rotulo, this.color}) : super(key: key);

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
