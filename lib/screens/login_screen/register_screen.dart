import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inteligence_artificial_app/components/label_text_input.dart';
import 'package:inteligence_artificial_app/helpers/form_validator_helper.dart';
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
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: ThemeColors.headerGradient),
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
    child: TextButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          try {
            UserCredential userCredential =
                await auth.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: senhaController.text);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
              print('The account already exists for that email.');
            }
          } catch (e) {
            print(e);
          }

          // VERIFICAR O ESTADO DO USUARIO, LOGADO OU NÃO
          auth.idTokenChanges().listen((User? usuario) {
            if (usuario == null) {
              print('O usuário está desconectado no momento!');
            } else {
              print('O usuário está conectado!');
            }
          });

          emailController.clear();
          senhaController.clear();
        }

        // Navigator.pushNamedAndRemoveUntil(context, "/gpt", (route) => false);
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

// Widget _labelTextInput(String hintText, bool isPassword, IconData icon,
//     TextEditingController controllerField) {
//   return Row(
//     children: [
//       Icon(icon, color: Colors.grey),
//       Container(
//         width: 250,
//         child: TextFormField(
//           validator: (value) {
//             if (validarValor(value)) {
//               return "Insira o valor correto";
//             } else {
//               return null;
//             }
//           },
//           controller: controllerField,
//           obscureText: isPassword,
//           cursorColor: Colors.white,
//           style: TextStyle(),
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.fromLTRB(10, 10, 20, 10),
//             hintText: hintText,
//             hintStyle: const TextStyle(
//               color: Color(0xffc5d2e1),
//               fontWeight: FontWeight.w400,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

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
