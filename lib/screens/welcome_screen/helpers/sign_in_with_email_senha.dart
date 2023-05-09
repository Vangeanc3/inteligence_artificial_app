import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void logarUsuarioEmailSenha(
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController senhaController,
    FirebaseAuth auth,
    BuildContext context) async {
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
        print(usuario.email);
        print('O usuário está conectado!');
        Navigator.pushReplacementNamed(context, "/gpt");
      }
    });
  }
}
