import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inteligence_artificial_app/utils/modal_utils.dart';
import 'package:inteligence_artificial_app/widgets/btn_ink.dart';
import 'package:inteligence_artificial_app/widgets/logo.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  var _emailController = TextEditingController();
  var _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
          child: Column(
            children: [
              Container(
                height: 400,
                child: Stack(
                  children: [
                    _backgroundRoxo(),
                    Positioned(
                      top: 50,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [logo(), _logoLabel()],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () => ModalUtils().callModalLogin(
                          context,
                          _formKey,
                          _emailController,
                          _senhaController,
                          auth,
                        ),
                        child: BtnInk(
                          texto: "Entrar",
                          context: context,
                          icon: null,
                          corTexto: Colors.white,
                          cor: Colors.purple[900],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 50, top: 10, left: 20, right: 20),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: BtnInk(
                        borda: true,
                        context: context,
                        texto: "Criar Conta",
                        cor: Colors.transparent,
                        icon: null,
                        corTexto: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _logoLabel() {
  return Text(
    "IA Assistente",
    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
  );
}

Widget _backgroundRoxo() {
  return Positioned(
    child: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/imgs/background.png"),
              fit: BoxFit.cover)),
    ),
  );
}

void entrarCallBack(
  BuildContext context,
  FirebaseAuth auth,
  GlobalKey<FormState> _formKey,
) async {
  final user = auth.currentUser;
  if (user != null) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Bem vindo de volta mestre!",
          style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.purple[900],
    ));
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushNamedAndRemoveUntil(context, "/gpt", (route) => false);
  } else {}
}
