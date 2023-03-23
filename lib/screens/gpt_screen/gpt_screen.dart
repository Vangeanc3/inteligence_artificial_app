import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/screens/gpt_screen/widgets/body_messages.dart';

import '../../components/input_box_message.dart';

class GptScreen extends StatefulWidget {
  const GptScreen({super.key});

  @override
  State<GptScreen> createState() => _GptScreenState();
}

class _GptScreenState extends State<GptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mobile GPT")),
      body: Stack(
        children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 50),
              child: BodyMessages()),
              Positioned(
                left: 8,
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: const InputBoxMessage(),
                ),
              )
        ],
      ),
    );
  }
}
