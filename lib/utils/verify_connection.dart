import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/pages/widgets/box_card.dart';
import 'package:inteligence_artificial_app/repositories/mensagens_repository.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

void verifyConnection(BuildContext context) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
    }
  } on SocketException catch (_) {
    Provider.of<MensagensRepository>(context, listen: false).addMensagem({
      "texto": const BoxCard(
          color: ThemeColors.erroColor,
          widget: Text("Sem conexão com a internet")),
      "receveid": true,
      "loading": true
    });
    print('not connected');
  }
}
