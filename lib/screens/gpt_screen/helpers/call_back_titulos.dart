void callBackTitulos(BuildContext context) async {
    Provider.of<MensagensTitulo>(context, listen: false).limpaLista();
    Provider.of<MensagensTitulo>(context, listen: false).iniciaLista();
  }