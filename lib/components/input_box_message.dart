import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inteligence_artificial_app/components/box_card.dart';
import 'package:inteligence_artificial_app/data/mensagens.dart';
import 'package:inteligence_artificial_app/models/chat_gpt.dart';
import 'package:inteligence_artificial_app/services/chat_gpt_service.dart';
import 'package:inteligence_artificial_app/themes/my_theme.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

class InputBoxMessage extends StatefulWidget {
  // final void Function() childChanged;
  const InputBoxMessage({
    super.key,
  });

  @override
  State<InputBoxMessage> createState() => _InputBoxMessageState();
}

class _InputBoxMessageState extends State<InputBoxMessage> {
  var msgController = TextEditingController();

  bool validarValor(String? valor) {
    if (valor != null && valor.isEmpty) {
      return false;
    }
    return true;
  }

  enviaMensagem(String mensagem, BuildContext context) async {
    Provider.of<Mensagens>(context, listen: false).addMensagem({
      "text": BoxCard(
        widget: Text(mensagem),
        color: ThemeColors.msgSendColor,
      ),
      "receveid": false,
    });

    Provider.of<Mensagens>(context, listen: false).addMensagem({
      "text": const BoxCard(
          widget: SpinKitThreeBounce(
        color: Colors.white,
        size: 10,
      )),
      "receveid": true,
      "loading": true
    });

    var resposta =
        await ChatGptService().buscarResposta(ChatGpt(mensagem: mensagem));

    // ignore: use_build_context_synchronously
    Provider.of<Mensagens>(context, listen: false).removeLoading();

    // ignore: use_build_context_synchronously
    Future.delayed(
      const Duration(milliseconds: 50),
      () {
        Provider.of<Mensagens>(context, listen: false).addMensagem(
            {"text": BoxCard(widget: Text(resposta)), "receveid": true});
      },
    );
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
                color: ThemeColors.temaWhats2,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: const Icon(Icons.send_rounded),
                onPressed: () {
                  enviaMensagem(msgController.text, context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
