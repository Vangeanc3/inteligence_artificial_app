import 'package:asyncstate/class/async_class.dart';
import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/pages/gpt_screen/gpt_screen.dart';
import 'package:inteligence_artificial_app/pages/register_screen/register_screen.dart';
import 'package:inteligence_artificial_app/pages/welcome_screen/welcome_screen.dart';
import 'package:inteligence_artificial_app/pages/splash/splash_screen.dart';
import 'package:inteligence_artificial_app/themes/my_theme.dart';
import 'package:page_transition/page_transition.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

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
