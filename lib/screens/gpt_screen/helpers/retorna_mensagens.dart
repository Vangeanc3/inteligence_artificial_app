
  void retornaMensagens(int id, BuildContext context) async {
    mensagens = await MensagensDao().retornaMensagem(id);
    final msgs = await MensagensDao().procurarMensagem(id);

    Provider.of<Mensagens>(context, listen: false).substituirMensagens(msgs);
  }