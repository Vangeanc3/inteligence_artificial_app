import 'package:asyncstate/asyncstate.dart';
import 'package:dart_openai/openai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/firebase_options.dart';
import 'package:inteligence_artificial_app/meu_aplicativo.dart';
import 'package:inteligence_artificial_app/repositories/mensagens_repository.dart';
import 'package:inteligence_artificial_app/repositories/mensagens_titulo.dart';
import 'package:inteligence_artificial_app/widgets/async_loading.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AsyncState.setLoaderPersonalized(
    defaultLoaderWidget: MyLoading(),
  );

  OpenAI.apiKey = "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";

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => MensagensTitulo(mensagensTitulo: [])),
    ChangeNotifierProvider(
        create: (context) => MensagensRepository(mensagens: [])),
  ], child: const MeuAplicativo()));
}


