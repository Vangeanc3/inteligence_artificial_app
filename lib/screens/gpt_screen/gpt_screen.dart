import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/data/ia_data.dart';
import 'package:inteligence_artificial_app/screens/gpt_screen/widgets/body_messages.dart';

import '../../components/input_box_message.dart';

class GptScreen extends StatefulWidget {
  GptScreen({super.key});
  bool reloadBool = true;

  @override
  State<GptScreen> createState() => _GptScreenState();
}

class _GptScreenState extends State<GptScreen> {
  reloadFunction() {
    setState(() {
      widget.reloadBool = !widget.reloadBool;
    });
    Map<String, dynamic> mapRequest = {
      "text": "",
      "receveid": true,
      "loading": true
    };

    mensagens.add(mapRequest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mobile GPT")),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 50),
            child: BodyMessages(),
          ),
          Positioned(
              left: 8,
              bottom: 0,
              right: 0,
              child: Container(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: InputBoxMessage(
                    childChanged: reloadFunction,
                  )))
        ],
      ),
    );
  }
}
