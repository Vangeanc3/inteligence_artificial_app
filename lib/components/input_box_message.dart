import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

class InputBoxMessage extends StatefulWidget {
  // final void Function() childChanged;
  const InputBoxMessage({super.key,});

  @override
  State<InputBoxMessage> createState() => _InputBoxMessageState();
}

class _InputBoxMessageState extends State<InputBoxMessage> {
  var msgController = TextEditingController();

  bool validarValor(String? valor) {
    if (valor != null && valor.isEmpty) {
      return true;
    }
    return false;
  }

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
       
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
