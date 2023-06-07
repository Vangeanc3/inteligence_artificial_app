import 'package:asyncstate/asyncstate.dart';
import 'package:dart_openai/openai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/firebase_options.dart';
import 'package:inteligence_artificial_app/meu_aplicativo.dart';
import 'package:inteligence_artificial_app/repositories/mensagens_repository.dart';
import 'package:inteligence_artificial_app/repositories/mensagens_titulo.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AsyncState.setLoaderPersonalized(
    defaultLoaderWidget: MyLoading(),
  );

  OpenAI.apiKey = "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";
  OpenAI.organization = null;

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => MensagensTitulo(mensagensTitulo: [])),
    ChangeNotifierProvider(create: (context) => MensagensRepository(mensagens: [])),
  ], child: const MeuAplicativo()));
}

class MyLoading extends StatelessWidget {
  final String? texto;
  const MyLoading({Key? key, this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Text(
            texto ?? 'Carregando Conteúdo...',
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
