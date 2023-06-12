import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/widgets/btn_ink.dart';

class Teste extends StatelessWidget {
  const Teste({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Center(
                child: BtnInk(
                    texto: "olá mundo",
                    corTexto: Colors.white,
                    context: context,
                    cor: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
