import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/components/box_card.dart';
import 'package:inteligence_artificial_app/data/mensagens.dart';
import 'package:inteligence_artificial_app/screens/gpt_screen/gpt_screen.dart';
import 'package:inteligence_artificial_app/screens/login_screen/login_screen.dart';
import 'package:inteligence_artificial_app/themes/my_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Mensagens(mensagens: [
        {
          "text": const BoxCard(widget: Text("Olá, em que posso ajuda-lo")),
          "receveid": true
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
      initialRoute: "/login",
      routes: {
        "/login": (context) => const LoginScreen(),
        "/gpt": (context) => const GptScreen()
      },
    );
  }
}
