import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/screens/chat_gpt_screen/gpt_screen.dart';
import 'package:inteligence_artificial_app/screens/login_screen/login_screen.dart';
import 'package:inteligence_artificial_app/themes/my_theme.dart';

void main() {
  runApp(const MyApp());
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
      initialRoute: "/gpt",
      routes: {
        "/login": (context) => const LoginScreen(),
        "/gpt": (context) => const GptScreen()
      },
    );
  }
}