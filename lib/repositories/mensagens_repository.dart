import 'package:flutter/material.dart';

class MensagensRepository extends ChangeNotifier {
  List<Map<String, dynamic>> mensagens;

  MensagensRepository({required this.mensagens});

  void addMensagem(Map<String, dynamic> mensagem) {
    mensagens.add(mensagem);
    notifyListeners();
  }

  int retornaId() {
    final id = mensagens.last["mensagens_id"];
    return id;
  }

  int retornaQuant() {
    return mensagens.length;
  }

  void substituirMensagens(List<Map<String, dynamic>> mensagens) {
    this.mensagens.clear();
    this.mensagens.addAll(mensagens);
    notifyListeners();
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
