import 'package:asyncstate/mixin/asyncstate_mixing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController with AsyncStateMixin {
  Future googleLoginMixin(
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

  Future facebookLoginMixin(
    BuildContext context,
  ) async {
    return await callAsyncLoader((signInWithFacebook()));
  }

  Future passwordLoginMixin(
      GlobalKey<FormState> formKey,
      TextEditingController emailController,
      TextEditingController senhaController,
      FirebaseAuth auth,
      BuildContext context) async {
    return await callAsyncLoader(signInWithEmailPassword(
            formKey, emailController, senhaController, auth, context))
        .then((value) {
      if (value != null) {
        Navigator.pushNamedAndRemoveUntil(context, "/gpt", (route) => false);
      }
    });
  }

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

  Future signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.accessToken?.token != null) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
