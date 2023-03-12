import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/screens/chat_gpt_screen/widgets/body_messages.dart';

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
      body: const BodyMessages(),
    );
  }
}
