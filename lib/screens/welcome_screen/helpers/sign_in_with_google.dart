void signInWithGoogle(FirebaseAuth auth, BuildContext context) async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  auth.idTokenChanges().listen((User? usuario) {
    if (usuario == null) {
      print('O usuário está desconectado no momento!');
    } else {
      print(usuario.email);
      print('O usuário está conectado!');
      Navigator.pushReplacementNamed(context, "/gpt");
    }
  });

  // return
  await FirebaseAuth.instance.signInWithCredential(credential);
}