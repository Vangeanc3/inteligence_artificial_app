import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inteligence_artificial_app/components/label_text_input.dart';
import 'package:inteligence_artificial_app/controllers/login_controller.dart';
import 'package:inteligence_artificial_app/screens/welcome_screen/widgets/login_btn.dart';
import 'package:inteligence_artificial_app/screens/welcome_screen/widgets/login_btn_ink.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _modelScaffoldKey = GlobalKey<ScaffoldState>();
  final auth = FirebaseAuth.instance;
  var _emailController = TextEditingController();
  var _senhaController = TextEditingController();

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
                padding: EdgeInsets.fromLTRB(20, 150, 20, 10),
                child: Container(
                  height: 50,
                  child: LoginBtn(
                    texto: "Entrar",
                    context: context,
                    icon: null,
                    corTexto: Colors.white,
                    cor: Colors.purple[900],
                    funcao: () async {
                      final user = auth.currentUser;
                      if (user != null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Bem vindo de volta mestre!",
                              style: TextStyle(color: Colors.white)),
                          backgroundColor: Colors.purple[900],
                        ));
                        await Future.delayed(Duration(seconds: 2));
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/gpt", (route) => false);
                      } else {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 210,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                child: Column(
                                  children: [
                                    LoginBtn(
                                      context: context,
                                      corTexto: Colors.white,
                                      texto: "Entrar com Email",
                                      cor: Colors.black,
                                      icon: Icon(Icons.email),
                                      funcao: () {
                                        // SE FOR LOGAR COM EMAIL ABRE UM FORMULARIO MODAL
                                        Navigator.pop(context);
                                        showModalBottomSheet(
                                          // isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(25))),
                                          context: context,
                                          builder: (context) {
                                            return Scaffold(
                                              body: Form(
                                                key: _formKey,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 20),
                                                  child: Wrap(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 30),
                                                        child: LabelTextInput(
                                                            hintText: "Email",
                                                            isPassword: false,
                                                            icon: Icons.mail,
                                                            controllerField:
                                                                _emailController),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 20),
                                                        child: LabelTextInput(
                                                            hintText: "Senha",
                                                            isPassword: true,
                                                            icon:
                                                                Icons.password,
                                                            controllerField:
                                                                _senhaController),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            bottom:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets
                                                                    .bottom),
                                                        child: LoginBtn(
                                                          context: context,
                                                          texto: "Entrar",
                                                          corTexto:
                                                              Colors.white,
                                                          cor: Colors.black,
                                                          icon:
                                                              Icon(Icons.send),
                                                          funcao: () async {
                                                            LoginController()
                                                                .passwordLogin(
                                                                    _formKey,
                                                                    _emailController,
                                                                    _senhaController,
                                                                    auth,
                                                                    context);
                                                          },
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text("ou"),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: InkWell(
                                          autofocus: true,
                                          splashColor: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          onTap: () {
                                            LoginController()
                                                .googleLogin(context);
                                          },
                                          child: BoxCarde(
                                            corTexto: Colors.black,
                                            texto: "Entrar com Google",
                                            cor: Colors.black,
                                            icon: Image.asset(
                                              "assets/icons/google.png",
                                              height: 20,
                                            ),
                                          )),
                                    ),
                                    LoginBtn(
                                      context: context,
                                      corTexto: Colors.white,
                                      texto: "Entrar com Facebook",
                                      cor: Colors.blue,
                                      icon: Image.asset(
                                        "assets/icons/facebook.png",
                                        height: 20,
                                      ),
                                      funcao: () {},
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }

                      // Navigator.pushNamed(context, "/login");
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  child: LoginBtn(
                      borda: true,
                      context: context,
                      texto: "Criar Conta",
                      cor: Colors.transparent,
                      icon: null,
                      funcao: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      corTexto: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
