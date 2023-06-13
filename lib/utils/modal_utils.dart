import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/controllers/login_controller.dart';
import 'package:inteligence_artificial_app/widgets/btn_ink.dart';
import 'package:inteligence_artificial_app/widgets/label_text_input.dart';

class ModalUtils {
  void callModalLogin(
    BuildContext context,
    GlobalKey<FormState> _formKey,
    TextEditingController _emailController,
    TextEditingController _senhaController,
    FirebaseAuth auth,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 210,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    _callModalEmailLogin(context, _formKey, _emailController,
                        _senhaController, auth);
                  },
                  child: BtnInk(
                    context: context,
                    corTexto: Colors.white,
                    texto: "Entrar com Email",
                    cor: Colors.black,
                    icon: Icon(Icons.email),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text("ou"),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                      autofocus: true,
                      splashColor: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        LoginController().googleLoginMixin(context);
                      },
                      child: BtnInk(
                        context: context,
                        corTexto: Colors.black,
                        texto: "Entrar com Google",
                        cor: Colors.white,
                        icon: Image.asset(
                          "assets/icons/google.png",
                          height: 20,
                        ),
                      )),
                ),
                InkWell(
                  child: BtnInk(
                    context: context,
                    corTexto: Colors.white,
                    texto: "Entrar com Facebook",
                    cor: Colors.blue,
                    icon: Image.asset(
                      "assets/icons/facebook.png",
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _callModalEmailLogin(
    BuildContext context,
    GlobalKey<FormState> _formKey,
    TextEditingController _emailController,
    TextEditingController _senhaController,
    FirebaseAuth auth,
  ) {
    // SE FOR LOGAR COM EMAIL ABRE UM FORMULARIO MODAL
    Navigator.pop(context);
    showModalBottomSheet(
      // isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      context: context,
      builder: (context) {
        return Scaffold(
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: LabelTextInput(
                        hintText: "Email",
                        isPassword: false,
                        icon: Icons.mail,
                        controllerField: _emailController),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: LabelTextInput(
                        hintText: "Senha",
                        isPassword: true,
                        icon: Icons.password,
                        controllerField: _senhaController),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: InkWell(
                      onTap: () {
                        LoginController().passwordLoginMixin(_formKey,
                            _emailController, _senhaController, auth, context);
                      },
                      child: BtnInk(
                        context: context,
                        texto: "Entrar",
                        corTexto: Colors.white,
                        cor: Colors.black,
                        icon: Icon(Icons.send),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
