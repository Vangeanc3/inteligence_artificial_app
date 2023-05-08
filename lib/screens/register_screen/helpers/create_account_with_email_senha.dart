void criaContaEmailSenha() async {
   if (formKey.currentState!.validate()) {
          try {
            UserCredential userCredential =
                await auth.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: senhaController.text);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
              print('The account already exists for that email.');
            }
          } catch (e) {
            print(e);
          }

          // VERIFICAR O ESTADO DO USUARIO, LOGADO OU NÃO
          auth.idTokenChanges().listen((User? usuario) {
            if (usuario == null) {
              print('O usuário está desconectado no momento!');
            } else {
              print('O usuário está conectado!');
            }
          });

          emailController.clear();
          senhaController.clear();
        }

        // Navigator.pushNamedAndRemoveUntil(context, "/gpt", (route) => false);
}