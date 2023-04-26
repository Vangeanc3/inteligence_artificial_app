import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

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
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                stops: [0.0, 0.66],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 400,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/imgs/background.png"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset("assets/app/logo_melhorada_branca.png",
                                width: 200),
                            Text(
                              "IA Assistente",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 150, 40, 0),
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
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 210,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                children: [
                                  _loginBtn(
                                    context,
                                    "Entrar com Email",
                                    Colors.black,
                                    Icon(Icons.email),
                                    () {
                                      
                                      loginEmail(context);
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text("ou"),
                                  ),
                                  _loginBtn(
                                      context,
                                      "Entrar com Google",
                                      Colors.white,
                                      Image.asset(
                                        "assets/icons/google.png",
                                        height: 20,
                                      ),
                                      () {},
                                      corTexto: Colors.black),
                                  _loginBtn(
                                    context,
                                    "Entrar com Facebook",
                                    Colors.blue,
                                    Image.asset(
                                      "assets/icons/facebook.png",
                                      height: 20,
                                    ),
                                    () {},
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );

                      // Navigator.pushNamed(context, "/login");
                    },
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
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

  void loginEmail(BuildContext context) {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _labelTextInput("Email", false, Icons.mail),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: _labelTextInput("Senha", false, Icons.mail),
                ),
                _loginBtn(context, "Entrar", Colors.black, Icon(Icons.send),
                    () {
                })
              ],
            ),
          ),
        );
      },
    );
  }
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

Widget _loginBtn(BuildContext context, String texto, Color? cor, Widget? icon,
    Function funcao,
    {Color corTexto = Colors.white}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => funcao(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: icon,
          ),
          Text(texto, style: TextStyle(color: corTexto)),
        ],
      ),
      style: ElevatedButton.styleFrom(
          padding: EdgeInsetsDirectional.symmetric(vertical: 10),
          backgroundColor: cor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    ),
  );
}





// GoogleFonts.josefinSans(

//                         textStyle: const TextStyle(

//                           color: Colors.white,

//                           fontWeight: FontWeight.w800,

//                           fontSize: 22,

//                         ),

//                       )