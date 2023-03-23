import 'package:flutter/material.dart';

class Mensagens extends ChangeNotifier {
  List<Map<String, dynamic>> mensagens;

  Mensagens({required this.mensagens});

  void addMensagem(Map<String, dynamic> mensagem) {
    mensagens.add(mensagem);
    notifyListeners();
  }
}
