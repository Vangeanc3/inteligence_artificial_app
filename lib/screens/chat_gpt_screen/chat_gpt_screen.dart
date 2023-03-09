import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GptScreen extends StatefulWidget {
  const GptScreen({super.key});

  @override
  State<GptScreen> createState() => _GptScreenState();
}

class _GptScreenState extends State<GptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mobile GPT"),
        ),
        body: Center(
          child: Center(
            child: Container(
              width: 350,
              height: 650,
              child: Column(
                children: [Text("Dados: "), TextFormField()],
              ),
            ),
          ),
        ));
  }
}
