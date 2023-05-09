  import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/data/mensagens.dart';
import 'package:provider/provider.dart';

void addMsgInicial(BuildContext context) {
    Provider.of<Mensagens>(context, listen: false).addMensagem({
      "texto": "Olá, em que posso ajuda-lo",
      "receveid": true,
      "loading": false
    });
  }