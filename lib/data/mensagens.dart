import 'package:flutter/material.dart';

class Mensagens extends ChangeNotifier {
  List<Map<String, dynamic>> mensagens;

  Mensagens({required this.mensagens});

  void addMensagem(Map<String, dynamic> mensagem) {
    mensagens.add(mensagem);
    notifyListeners();
  }

  int retornaQuant() {
    return mensagens.length;
  }

  void removeLoading() {
    mensagens.removeWhere((elemento) => elemento["loading"] == true);
    notifyListeners();
  }

  void limpaMsgs() {
    mensagens.clear();
    notifyListeners();
  }
}
