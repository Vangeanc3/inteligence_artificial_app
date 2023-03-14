import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/data/ia_data.dart';
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
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeColors.primaryColor),
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
                decoration: const InputDecoration(
                    hintText: "Sua dúvida",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 10),
            child: Container(
              decoration: BoxDecoration(
                color: ThemeColors.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: const Icon(Icons.send_rounded),
                onPressed: () {
                  enviarRequisicao(msgController.text);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enviarRequisicao(String request) {
  print(mensagens);
  Map<String, dynamic> mapRequest = {"text": request, "receveid": false};
  mensagens.add(mapRequest);
  print(mensagens);
}

bool validarValor(String? valor) {
  if (valor != null && valor.isEmpty) {
    return true;
  }
  return false;
}
