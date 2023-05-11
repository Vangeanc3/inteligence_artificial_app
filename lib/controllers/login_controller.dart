import 'package:asyncstate/mixin/asyncstate_mixing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/screens/register_screen/helpers/create_account_with_email_senha.dart';
import 'package:inteligence_artificial_app/screens/welcome_screen/helpers/sign_in_with_google.dart';
import 'package:inteligence_artificial_app/screens/welcome_screen/helpers/sign_in_with_email_password.dart';

class LoginController with AsyncStateMixin {
  Future googleLogin(
    BuildContext context,
  ) async {
    return await callAsyncLoader(
      signInWithGoogle(),
    ).then((value) {
      if (value != null) {
        print(
            "----------------------------------------------------------------------------------------------------------");
        print(value);
        Navigator.pushReplacementNamed(context, "/gpt");
      }
    });
  }

  Future passwordLogin(
      GlobalKey<FormState> formKey,
      TextEditingController emailController,
      TextEditingController senhaController,
      FirebaseAuth auth,
      BuildContext context) async {
    return await callAsyncLoader(signInWithEmailPassword(
        formKey, emailController, senhaController, auth, context));
  }

  Future passwordSignUp(
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController senhaController,
    FirebaseAuth auth,
    BuildContext context
  ) async {
    return await callAsyncLoader(
        criaContaEmailSenha(formKey, auth, emailController, senhaController, context));
  }
}
