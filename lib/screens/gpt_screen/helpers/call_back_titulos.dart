import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/data/mensagens_titulo.dart';
import 'package:provider/provider.dart';

void callBackTitulos(BuildContext context) async {
    Provider.of<MensagensTitulo>(context, listen: false).limpaLista();
    Provider.of<MensagensTitulo>(context, listen: false).iniciaLista();
  }