import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

class InputBoxMessage extends StatefulWidget {
  const InputBoxMessage({super.key});

  @override
  State<InputBoxMessage> createState() => _InputBoxMessageState();
}

class _InputBoxMessageState extends State<InputBoxMessage> {
  var msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TextFormField(
              controller: msgController,
              validator: (value) {
                if (validarValor(value)) {
                  return "Insira algum texto";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.multiline,
              // expands: true,
              minLines: 1,
              maxLines: 4,
              decoration: const InputDecoration(hintText: "Sua dúvida"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 10),
            child: Container(
              decoration: BoxDecoration(
                color: ThemeColors.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: const Icon(Icons.send_rounded),
                onPressed: () {
                  enviarMsg(msgController.text);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enviarMsg(String msg) {
  print(msg);
}

bool validarValor(String? valor) {
  if (valor != null && valor.isEmpty) {
    return true;
  }
  return false;
}
