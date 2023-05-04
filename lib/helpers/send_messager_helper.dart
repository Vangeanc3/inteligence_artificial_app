// ignore_for_file: use_build_context_synchronously

import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inteligence_artificial_app/components/box_card.dart';
import 'package:inteligence_artificial_app/data/mensagens.dart';
import 'package:inteligence_artificial_app/data/mensagens_dao.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

enviaMensagem(String mensagem, BuildContext context, int? id) async {
  late OpenAIChatCompletionModel chatCompletion;
  print(id);
  // MENSAGEM ENVIADA PELO USUARIO ARMAZENADA NO DISPOSITIVO
  if (id != null) {
    await MensagensDao()
        .addMsg({"texto": mensagem, "receveid": false, "loading": false}, id);
  }

  // MENSAGEM ENVIADA PELO USUÁRIO
  Provider.of<Mensagens>(context, listen: false)
      .addMensagem({"texto": mensagem, "receveid": false, "loading": false});

  // WIDGET DE LOADING ENQUANTO A MENSAGEM CHEGA
  Provider.of<Mensagens>(context, listen: false).addMensagem({
    "texto": BoxCard(
        widget: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 70),
      child: SpinKitThreeBounce(
        color: Colors.white,
        size: 10,
      ),
    )),
    "receveid": true,
    "loading": true
  });

  // RESPONSE DA REQUEST
  try {
    chatCompletion = await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: mensagem,
          role: OpenAIChatMessageRole.user,
        ),
      ],
    );

    switch (chatCompletion.choices[0].message.content) {
      case "erro ao se comunicar com o servidor":
        Provider.of<Mensagens>(context, listen: false).removeLoading();
        Provider.of<Mensagens>(context, listen: false).addMensagem({
          "texto": const BoxCard(
            color: ThemeColors.erroColor,
            widget: Text(
                "Erro ao tentar se comunicar com a inteligência artificial, tente enviar uma mensagem para o administrador. "
                "Pois, precisamos corrigir esse erro imediatamente."),
          ),
          "receveid": true,
          "loading": true // PARA APARECER COMO WIDGET PERSONALIZADO NA COR RED
        });
        break;
      default:
        if (id != null) {
          await MensagensDao().addMsg({
            "texto": chatCompletion.choices[0].message.content,
            "receveid": true,
            "loading": false
          }, id);
        }

        Provider.of<Mensagens>(context, listen: false)
            .removeLoading(); // FUNÇÃO QUE REMOVE O LOADING

        Future.delayed(
          // MOSTRANDO A RESPONSE PARA O USUÁRIO
          const Duration(milliseconds: 50),
          () {
            Provider.of<Mensagens>(context, listen: false).addMensagem({
              "texto": chatCompletion.choices[0].message.content,
              "receveid": true,
              "loading": false
            });
          },
        );
    }
  } on RequestFailedException catch (e) {
    Provider.of<Mensagens>(context, listen: false).removeLoading();
        Provider.of<Mensagens>(context, listen: false).addMensagem({
          "texto": const BoxCard(
            color: ThemeColors.erroColor,
            widget: Text(
              "Erro ao se comunicar com a IA. Pode ser falta de tokens"),
          ),
          "receveid": true,
          "loading": true // PARA APARECER COMO WIDGET PERSONALIZADO NA COR RED
        });
  }
}
