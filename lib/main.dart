import 'package:asyncstate/asyncstate.dart';
import 'package:dart_openai/openai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/data/mensagens.dart';
import 'package:inteligence_artificial_app/data/mensagens_titulo.dart';
import 'package:inteligence_artificial_app/screens/gpt_screen/gpt_screen.dart';
import 'package:inteligence_artificial_app/screens/register_screen/register_screen.dart';
import 'package:inteligence_artificial_app/screens/teste_screen/teste_screen.dart';
import 'package:inteligence_artificial_app/screens/welcome_screen/welcome_screen.dart';
import 'package:inteligence_artificial_app/splash/splash_screen.dart';
import 'package:inteligence_artificial_app/themes/my_theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

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
    ChangeNotifierProvider(create: (context) => Mensagens(mensagens: [])),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        AsyncState.observer,
      ],
      title: 'IA Mobile',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreen(),
        "/teste": (context) => const TesteScreen()
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/register":
            return PageTransition(
                child: RegisterScreen(),
                type: PageTransitionType.bottomToTop,
                duration: const Duration(milliseconds: 300));
          case "/gpt":
            return PageTransition(
                child: GptScreen(),
                type: PageTransitionType.bottomToTop,
                duration: const Duration(milliseconds: 300));
          case "/welcome":
            return PageTransition(
                child: WelcomeScreen(),
                type: PageTransitionType.bottomToTop,
                duration: Duration(microseconds: 300));
          default:
            return null;
        }
      },
    );
  }
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
