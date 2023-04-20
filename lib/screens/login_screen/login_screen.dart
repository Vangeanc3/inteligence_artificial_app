import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
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
                        _logo(),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: _iconsLogin(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 20),
                          child: _labelTextInput("Email", false, Icons.mail),
                        ),
                        _labelTextInput("Senha", true, Icons.password),
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

Widget _loginBtn(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: ThemeColors.headerGradient),
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
    child: TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, "/gpt");
      },
      child: Text(
        "Login",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    ),
  );
}

Widget _registerBtn(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      border: Border.all(width: 2, color: Colors.white),
    ),
    child: TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, "/gpt");
      },
      child: Text(
        "Criar Conta",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    ),
  );
}

Widget _labelTextInput(String hintText, bool isPassword, IconData icon) {
  return Row(
    children: [
      Icon(icon, color: Colors.grey),
      Container(
        width: 250,
        child: TextField(
          obscureText: isPassword,
          cursorColor: Colors.white,
          style: TextStyle(),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 10, 20, 10),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xffc5d2e1),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _iconsLogin() {
  return Container(
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Image.asset(
        "assets/icons/google.png",
        width: 40,
      ),
      Image.asset(
        "assets/icons/facebook.png",
        width: 40,
      )
    ]),
  );
}

Widget _logo() {
  return Center(
    child: SizedBox(
      child: Image.asset(
        "assets/app/logo_melhorada_branca.png",
        width: 200,
      ),
    ),
  );
}
