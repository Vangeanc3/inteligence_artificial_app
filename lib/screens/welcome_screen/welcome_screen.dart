import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inteligence_artificial_app/components/label_text_input.dart';
import 'package:inteligence_artificial_app/screens/welcome_screen/widgets/login_btn.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var _emailController = TextEditingController();
    var _senhaController = TextEditingController();
    FirebaseAuth auth = FirebaseAuth.instance;

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
                  // decoration: BoxDecoration(
                  //   gradient: LinearGradient(
                  //       begin: Alignment.topCenter,
                  //       end: Alignment.bottomCenter,
                  //       colors: ThemeColors.headerGradient),
                  //   borderRadius: BorderRadius.all(Radius.circular(50)),
                  // ),
                  child: LoginBtn(
                    texto: "Entrar",
                    context: context,
                    icon: null,
                    corTexto: Colors.white,
                    cor: Colors.purple[900],
                    funcao: () {
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
                                        context: context,
                                        builder: (context) {
                                          return Form(
                                            key: _formKey,
                                            child: SizedBox(
                                              height: 250,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
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
                                                          const EdgeInsets.only(
                                                              bottom: 20),
                                                      child: LabelTextInput(
                                                          hintText: "Senha",
                                                          isPassword: false,
                                                          icon: Icons.mail,
                                                          controllerField:
                                                              _senhaController),
                                                    ),
                                                    LoginBtn(
                                                      context: context,
                                                      texto: "Entrar",
                                                      corTexto: Colors.white,
                                                      cor: Colors.black,
                                                      icon: Icon(Icons.send),
                                                      funcao: () async {
                                                        logarUsuarioEmailSenha(
                                                            _formKey,
                                                            _emailController,
                                                            _senhaController,
                                                            auth);
                                                      },
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
                                  LoginBtn(
                                      context: context,
                                      texto: "Entrar com Google",
                                      cor: Colors.white,
                                      icon: Image.asset(
                                        "assets/icons/google.png",
                                        height: 20,
                                      ),
                                      funcao: () {},
                                      corTexto: Colors.black),
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

  void logarUsuarioEmailSenha(
      GlobalKey<FormState> formKey,
      TextEditingController emailController,
      TextEditingController senhaController,
      FirebaseAuth auth) async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: senhaController.text);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('Nenhum usuário encontrado para esse e-mail.');
        } else if (e.code == 'wrong-password') {
          print('Senha errada fornecida para esse usuário');
        }
      }

      // VERIFICAR O ESTADO DO USUARIO, LOGADO OU NÃO
      auth.idTokenChanges().listen((User? usuario) {
        if (usuario == null) {
          print('O usuário está desconectado no momento!');
        } else {
          print('O usuário está conectado!');
        }
      });
    }
  }
}
// GoogleFonts.josefinSans(

//                         textStyle: const TextStyle(

//                           color: Colors.white,

//                           fontWeight: FontWeight.w800,

//                           fontSize: 22,

//                         ),

//                       )
