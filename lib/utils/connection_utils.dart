import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/widgets/box_card.dart';
import 'package:inteligence_artificial_app/repositories/mensagens_repository.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

class ConnectionUtils {
  void checkInternetConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("conectado a uma conexão de dados");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("conectado a uma conexão wifi");
    } else {
      print("sem conexão");
    }
  }

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
}
