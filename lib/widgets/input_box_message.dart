// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/repositories/mensagens_repository.dart';
import 'package:inteligence_artificial_app/data/mensagens_dao.dart';
import 'package:inteligence_artificial_app/utils/form_validator_helper.dart';
import 'package:inteligence_artificial_app/utils/send_messager_helper.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

class InputBoxMessage extends StatefulWidget {
  final Function(Map<String, dynamic>?)
      callBack; // CALL BACK PARA PASSAR OS DADOS PARA O WIDGET PAI

  const InputBoxMessage({super.key, required this.callBack});

  @override
  State<InputBoxMessage> createState() => _InputBoxMessageState();
}

class _InputBoxMessageState extends State<InputBoxMessage> {
  var msgController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var mensagens; // LATE, POIS ELA SERÁ ATRIBUIDA, ASSIM QUE O USUÁRIO ENVIAR UMA MSG

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
                      final quant =
                          Provider.of<MensagensRepository>(context, listen: false)
                              .retornaQuant();

                      if (quant == 1) {
                        // CONDIÇÃO QUE VERIFICA SE TEM MENSAGENS, ELE SÓ VAI CRIAR SE A QUANTIDADE DE MENSAGENS FOR IGUAL A 1
                        mensagens = await MensagensDao().criarMensagens();
                        widget.callBack(mensagens);
                      } else if (quant >= 2) {
                        mensagens = widget.callBack(mensagens);
                        print("mensagens parametro $mensagens");
                      }

                      enviaMensagem(
                          msgController.text, context, mensagens["id"]);

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
