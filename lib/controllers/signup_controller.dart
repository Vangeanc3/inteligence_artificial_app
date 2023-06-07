import 'package:asyncstate/mixin/asyncstate_mixing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpController with AsyncStateMixin {
  Future passwordSignUp(
      GlobalKey<FormState> formKey,
      TextEditingController emailController,
      TextEditingController senhaController,
      FirebaseAuth auth,
      BuildContext context) async {
    return await callAsyncLoader(criaContaEmailSenha(
            formKey, auth, emailController, senhaController, context))
        .then((value) {
      if (value != null) {
        Navigator.pushNamedAndRemoveUntil(context, "/gpt", (route) => false);
      }
    });
  }

  Future criaContaEmailSenha(
    GlobalKey<FormState> formKey,
    FirebaseAuth auth,
    TextEditingController emailController,
    TextEditingController senhaController,
    BuildContext context) async {
  if (formKey.currentState!.validate()) {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: senhaController.text);

      emailController.clear();
      senhaController.clear();

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Senha fraca")));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("E-mail já está em uso")));
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    // VERIFICAR O ESTADO DO USUARIO, LOGADO OU NÃO
    // auth.idTokenChanges().listen((User? usuario) {
    //   if (usuario == null) {
    //     print('O usuário está desconectado no momento!');
    //   } else {
    //     print('O usuário está conectado!');
    //   }
    // });
  }
}
}

