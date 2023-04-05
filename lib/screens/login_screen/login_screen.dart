import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 200,
                  left: -100,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Color(0x304599ff),
                      borderRadius: BorderRadius.all(
                        Radius.circular(150),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: -10,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Color(0x30cc33ff),
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 80,
                      sigmaY: 80,
                    ),
                    child: Container(),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60, bottom: 0),
                          child: _logo(),
                        ),
                        _loginLabel(),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: _iconsLogin(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 20),
                          child: _labelTextInput(
                              "Email", "seunome@examplo.com", false),
                        ),
                        _labelTextInput("Senha", "suasenha", true),
                        Padding(
                          padding: const EdgeInsets.only(top: 80.0, bottom: 15),
                          child: _loginBtn(context),
                        ),
                        _registerBtn(context)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget _signUpLabel(String label, Color textColor) {
  return Text(
    label,
    style: GoogleFonts.josefinSans(
      textStyle: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w800,
        fontSize: 16,
      ),
    ),
  );
}

Widget _loginBtn(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 60,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: ThemeColors.headerGradient),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, "/gpt");
      },
      child: Text(
        "Login",
        style: GoogleFonts.josefinSans(
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
      ),
    ),
  );
}

Widget _registerBtn(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      border: Border.all(width: 2, color: Colors.white),
    ),
    child: TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, "/gpt");
      },
      child: Text(
        "Criar Conta",
        style: GoogleFonts.josefinSans(
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
      ),
    ),
  );
}

Widget _labelTextInput(String label, String hintText, bool isPassword) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.josefinSans(
          textStyle: const TextStyle(
            color: Color(0xff8fa1b6),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      TextField(
        obscureText: isPassword,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              color: Color(0xffc5d2e1),
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffdfe8f3)),
          ),
        ),
      ),
    ],
  );
}

Widget _iconsLogin() {
  return Container(
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Image.asset(
        "assets/icons/google.png",
        width: 50,
      ),
      Image.asset(
        "assets/icons/facebook.png",
        width: 50,
      )
    ]),
  );
}

Widget _loginLabel() {
  return Center(
    child: Text(
      "IA-Assistente",
      style: GoogleFonts.josefinSans(
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 34,
        ),
      ),
    ),
  );
}

Widget _logo() {
  return Center(
    child: SizedBox(
      child: Image.asset(
        "assets/app/icon-android.png",
        width: 120,
      ),
    ),
  );
}
