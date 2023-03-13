import 'package:flutter/material.dart';
import '../../../components/box_card.dart';

class BodyMessages extends StatelessWidget {
  const BodyMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView(
      padding: const EdgeInsets.all(8.0),
      children: const [
        Padding(
          padding: EdgeInsets.only(right: 50, bottom: 10),
          child: BoxCard(widget: Text("Olá, como posso ajudar você?")),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50, bottom: 10),
          child: BoxCard(
              color: Colors.indigoAccent,
              widget: Text("Quem é a menina mais bonita?")),
        ),
        Padding(
          padding: EdgeInsets.only(right: 50, bottom: 10),
          child: BoxCard(
              widget: Text(
                  "Hahaha, pergunta fácil. É claro que é a iasmim! Uma japa muito linda e perfeita")),
        ),
      ],
    ));
  }
}
