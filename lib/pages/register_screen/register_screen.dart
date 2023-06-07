import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/widgets/label_text_input.dart';
import 'package:inteligence_artificial_app/controllers/login_controller.dart';
import 'package:inteligence_artificial_app/controllers/signup_controller.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final auth = FirebaseAuth.instance;
    var _emailController = TextEditingController();
    var _senhaController = TextEditingController();

    return Form(
      key: _formKey,
      child: Scaffold(
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
                    top: 100,
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
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          _logo(),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: _iconsLogin(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50, bottom: 20),
                            child: LabelTextInput(
                                hintText: "Email",
                                isPassword: false,
                                icon: Icons.mail,
                                controllerField: _emailController),
                          ),
                          LabelTextInput(
                              hintText: "Senha",
                              isPassword: true,
                              icon: Icons.password,
                              controllerField: _senhaController),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: _loginBtn(context, auth, _formKey,
                                _emailController, _senhaController),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

Widget _loginBtn(
    BuildContext context,
    FirebaseAuth auth,
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController senhaController) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      color: null,
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: ThemeColors.headerGradient),
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
    child: TextButton(
      onPressed: () {
        SignUpController().passwordSignUp(
            formKey, emailController, senhaController, auth, context);
      },
      child: Text(
        "Criar",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    ),
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
