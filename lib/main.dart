import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/screens/chat_gpt_screen/chat_gpt_screen.dart';
import 'package:inteligence_artificial_app/screens/login_screen/login_screen.dart';

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
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey[900],
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      initialRoute: "/gpt",
      routes: {
        "/login": (context) => const LoginScreen(),
        "/gpt": (context) => const GptScreen()
      },
    );
  }
}
