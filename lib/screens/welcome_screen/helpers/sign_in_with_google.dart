import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<bool> signInWithGoogle(FirebaseAuth auth, BuildContext context) async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  try {
    var t = await FirebaseAuth.instance.signInWithCredential(credential);
    print("usuárioooooooooo: {$t.user}");
    return true; // retorna true se o processo de autenticação for bem-sucedido
  } catch (e) {
    print("Erro ao autenticar com o Google: $e");
    return false; // retorna false se o processo de autenticação falhar
  }
}
