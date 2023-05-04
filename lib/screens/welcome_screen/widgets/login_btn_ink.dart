import 'package:flutter/material.dart';

class BoxCarde extends StatelessWidget {
  final String texto;
  final Color? cor;
  final Widget? icon;
  final Color corTexto;
  final bool borda;

  const BoxCarde(
      {super.key,
      required this.texto,
      this.cor,
      this.icon,
      required this.corTexto,
      this.borda = false});

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: kElevationToShadow[3],
          borderRadius: BorderRadius.circular(100),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: icon,
          ),
          Text(texto, style: TextStyle(color: corTexto)),
        ],
      ),
    );
  }
}
