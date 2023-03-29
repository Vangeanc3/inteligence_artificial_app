import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/components/box_card.dart';
import 'package:inteligence_artificial_app/data/mensagens.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

void verifyConnection(BuildContext context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      Provider.of<Mensagens>(context, listen: false).addMensagem({
        "text": const BoxCard(color: ThemeColors.erroColor, widget: Text("Sem conexão com a internet")),
        "receveid": true
      });
      print('not connected');
    }
  }