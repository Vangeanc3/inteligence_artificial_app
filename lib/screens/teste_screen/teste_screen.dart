import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/components/btn_ink.dart';

class TesteScreen extends StatelessWidget {
  const TesteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState>();
    return Scaffold(
        body: Center(
      child: InkWell(
        onTap: () {},
        child: BtnInk(
            texto: "Teste",
            corTexto: Colors.black,
            cor: Colors.white,
            gradient: null,
            icon: null,
            borda: true),
      ),
    ));
  }
}
