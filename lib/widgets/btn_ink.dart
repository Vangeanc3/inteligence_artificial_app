import 'package:flutter/material.dart';

class BtnInk extends StatelessWidget {
  final String texto;
  final Color? cor;
  final Widget? icon;
  final Color corTexto;
  final bool borda;
  final LinearGradient? gradient;
  final BuildContext context;
  final Function function;

  const BtnInk(
      {super.key,
      required this.texto,
      this.cor,
      this.gradient,
      this.icon,
      required this.corTexto,
      this.borda = false,
      required this.context, required this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function(),
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            boxShadow: kElevationToShadow[3],
            borderRadius: BorderRadius.circular(100),
            color: cor,
            gradient: gradient),
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
      ),
    );
  }
}
