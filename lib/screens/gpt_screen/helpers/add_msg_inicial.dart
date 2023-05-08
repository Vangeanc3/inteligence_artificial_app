  void addMsgInicial(BuildContext context) {
    Provider.of<Mensagens>(context, listen: false).addMensagem({
      "texto": "Olá, em que posso ajuda-lo",
      "receveid": true,
      "loading": false
    });
  }