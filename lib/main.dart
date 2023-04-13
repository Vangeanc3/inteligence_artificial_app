import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/components/box_card.dart';
import 'package:inteligence_artificial_app/data/database.dart';
import 'package:inteligence_artificial_app/data/mensagens.dart';
import 'package:inteligence_artificial_app/data/mensagens_dao.dart';
import 'package:inteligence_artificial_app/screens/gpt_screen/gpt_screen.dart';
import 'package:inteligence_artificial_app/screens/login_screen/login_screen.dart';
import 'package:inteligence_artificial_app/screens/welcome_screen/welcome_screen.dart';
import 'package:inteligence_artificial_app/splash/splash_screen.dart';
import 'package:inteligence_artificial_app/themes/my_theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  OpenAI.apiKey = "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";
  OpenAI.organization = null;

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Mensagens(mensagens: [
        {
          "text": const BoxCard(widget: Text("Olá, em que posso ajuda-lo")),
          "receveid": true,
        }
      ]),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IA Mobile',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreen()
        // "/gpt": (context) => const GptScreen(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return PageTransition(
                child: WelcomeScreen(),
                type: PageTransitionType.bottomToTop,
                duration: const Duration(milliseconds: 500));
          case "/login":
            return PageTransition(
                child: LoginScreen(),
                type: PageTransitionType.bottomToTop,
                duration: const Duration(milliseconds: 500));
          case "/gpt":
            return PageTransition(
                child: GptScreen(),
                type: PageTransitionType.bottomToTop,
                duration: const Duration(milliseconds: 500));
          default:
            return null;
        }
      },
    );
  }
}
