// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inteligence_artificial_app/components/box_card.dart';
import 'package:inteligence_artificial_app/data/mensagens.dart';
import 'package:inteligence_artificial_app/models/chat_gpt.dart';
import 'package:inteligence_artificial_app/services/chat_gpt_service.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

enviaMensagem(String mensagem, BuildContext context) async {
    // MENSAGEM ENVIADA PELO USUÁRIO
    Provider.of<Mensagens>(context, listen: false).addMensagem({
      "text": BoxCard(
        widget: Text(mensagem),
        color: ThemeColors.msgSendColor,
      ),
      "receveid": false,
    });

    // WIDGET DE LOADING ENQUANTO A MENSAGEM CHEGA
    Provider.of<Mensagens>(context, listen: false).addMensagem({
      "text": const BoxCard(
          widget: SpinKitThreeBounce(
        color: Colors.white,
        size: 10,
      )),
      "receveid": true,
      "loading": true
    });

    // RESPONSE DA REQUEST
    var resposta =
        await ChatGptService().buscarResposta(ChatGpt(mensagem: mensagem));

    switch (resposta) {
      case "erro ao se comunicar com o servidor":
        Provider.of<Mensagens>(context, listen: false).removeLoading();
        Provider.of<Mensagens>(context, listen: false).addMensagem({
          "text": const BoxCard(
            color: ThemeColors.erroColor,
            widget: Text(
                "Erro ao tentar se comunicar com a inteligência artificial, tente enviar uma mensagem para o administrador. "
                "Pois, precisamos corrigir esse erro imediatamente."),
          ),
          "receveid": true
        });
        break;
      default:
        Provider.of<Mensagens>(context, listen: false)
            .removeLoading(); // FUNÇÃO QUE REMOVE O LOADING

        Future.delayed(
          // MOSTRANDO A RESPONSE PARA O USUÁRIO
          const Duration(milliseconds: 50),
          () {
            Provider.of<Mensagens>(context, listen: false).addMensagem(
                {"text": BoxCard(widget: Text(resposta)), "receveid": true});
          },
        );
    }
  }