

  import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/data/mensagens.dart';
import 'package:provider/provider.dart';

void limpaMsgs(BuildContext context) {
    Provider.of<Mensagens>(context, listen: false).limpaMsgs();
  }