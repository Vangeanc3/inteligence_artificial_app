// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/helpers/form_validator_helper.dart';
import 'package:inteligence_artificial_app/helpers/send_messager_helper.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

class InputBoxMessage extends StatefulWidget {
  const InputBoxMessage({
    super.key,
  });

  @override
  State<InputBoxMessage> createState() => _InputBoxMessageState();
}

class _InputBoxMessageState extends State<InputBoxMessage> {
  var msgController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeColors.temaWhats3),
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
                  minLines: 1,
                  maxLines: 4,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
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
                  color: ThemeColors.temaWhats2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  icon: const Icon(Icons.send_rounded),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      enviaMensagem(msgController.text, context);
                      msgController.clear();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
