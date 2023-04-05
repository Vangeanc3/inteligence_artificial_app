import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.black,
                  // Color.fromRGBO(103, 99, 234, 1.0),
                  // Color.fromRGBO(195, 107, 255, 1.0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.8],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: 350,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/app/icon-android.png", width: 200),
                    Text(
                      "IA Assistente",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: ThemeColors.headerGradient),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                      child: Text(
                        "Entrar",
                        style: GoogleFonts.josefinSans(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
