import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/helpers/verify_connection.dart';
import 'package:inteligence_artificial_app/screens/gpt_screen/widgets/body_messages.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';
import 'package:inteligence_artificial_app/components/input_box_message.dart';

class GptScreen extends StatefulWidget {
  const GptScreen({super.key});

  @override
  State<GptScreen> createState() => _GptScreenState();
}

class _GptScreenState extends State<GptScreen> {
  @override
  void initState() {
    super.initState();
    verifyConnection(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ThemeColors.temaWhats2,
          title: const Text("Mobile GPT")),
      body: Stack(
        children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 75), child: BodyMessages()),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 70, maxHeight: 150),
              child: Container(
                decoration: const BoxDecoration(color: ThemeColors.temaWhats2),
                padding: const EdgeInsets.only(bottom: 5, left: 5, top: 5),
                child: const InputBoxMessage(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
