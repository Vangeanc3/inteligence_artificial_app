import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/data/mensagens_dao.dart';

class MensagensTitulo extends ChangeNotifier {
  List<Map<String, dynamic>> mensagensTitulo;

  MensagensTitulo({required this.mensagensTitulo});

  void iniciaLista() async {
    final List<Map<String, dynamic>> titulo =
        await MensagensDao().procurarMensagemTitle();

    mensagensTitulo.addAll(titulo);
    notifyListeners();
  }

  void limpaLista() {
    mensagensTitulo.clear();
    notifyListeners();
  }
}
