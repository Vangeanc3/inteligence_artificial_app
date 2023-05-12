import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future signInWithEmailPassword(
  GlobalKey<FormState> formKey,
  TextEditingController emailController,
  TextEditingController senhaController,
  FirebaseAuth auth,
  BuildContext context,
) async {
  if (formKey.currentState!.validate()) {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: senhaController.text);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Usuário não encontrado")));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Senha errada")));
      }
    }
  }
}
