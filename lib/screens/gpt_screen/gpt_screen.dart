import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/data/mensagens.dart';
import 'package:inteligence_artificial_app/data/mensagens_dao.dart';
import 'package:inteligence_artificial_app/helpers/verify_connection.dart';
import 'package:inteligence_artificial_app/screens/gpt_screen/widgets/body_messages.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';
import 'package:inteligence_artificial_app/components/input_box_message.dart';
import 'package:provider/provider.dart';

class GptScreen extends StatefulWidget {
  const GptScreen({super.key});

  @override
  State<GptScreen> createState() => _GptScreenState();
}

class _GptScreenState extends State<GptScreen> {
  late Map<String, dynamic> mensagens;

  @override
  void initState() {
    super.initState();
    verifyConnection(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      limpaMsgs(context);
      addMsgInicial(context);
    });
    // Chamar a função que inicializa o banco de dados ao entrar na tela do chat
  }

  @override
  void dispose() {
    // Limpa a lista quando o widget é descartado
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: Icon(Icons.account_circle, size: 50),
                accountName: Text("Ismael Martins"),
                accountEmail: Text("ismaelmartins919@gmail.com")),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {},
            ),
            Expanded(child: Container()),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: ThemeColors.temaWhats2,
        title: const Text("Mobile GPT"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                limpaMsgs(context);
                addMsgInicial(context);
              },
              icon: const Icon(Icons.add, size: 30)),
        ],
      ),
      body: Stack(
        children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 75), child: BodyMessages()),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 70, maxHeight: 150),
              child: Container(
                decoration: const BoxDecoration(color: ThemeColors.temaWhats2),
                padding: const EdgeInsets.only(bottom: 5, left: 5, top: 5),
                child: FutureBuilder( // O FUTURE É USADO, POIS ESTAMOS PASSANDO UM VALOR QUE É DO FUTURO O ID!!!
                  future: fetchData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return InputBoxMessage(id: snapshot.data["id"]);
                    } else if (snapshot.hasError) {
                      return Text('Erro: ${snapshot.error}');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void addMsgInicial(BuildContext context) {
    Provider.of<Mensagens>(context, listen: false).addMensagem({
      "text": "Olá, em que posso ajuda-lo",
      "receveid": true,
      "loading": false
    });
  }

  void limpaMsgs(BuildContext context) {
    Provider.of<Mensagens>(context, listen: false).limpaMsgs();
  }

  Future<Map> fetchData() async {
    mensagens = await MensagensDao()
        .criarMensagens(); // Sempre vai gerar uma nova mensagem no banco de dados
    print("Dados recebidos $mensagens");

    return mensagens;
  }
}
