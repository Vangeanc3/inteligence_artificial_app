import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/widgets/box_card.dart';
import 'package:inteligence_artificial_app/repositories/mensagens_repository.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

class BodyMessages extends StatefulWidget {
  const BodyMessages({super.key});

  @override
  State<BodyMessages> createState() => _BodyMessagesState();
}

class _BodyMessagesState extends State<BodyMessages> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MensagensRepository>(
      builder: (context, list, child) {
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Align(
                  alignment: (list.mensagens[index][
                          "receveid"]) // CONDIÇÃO QUE VERIFICA SE A MENSAGEM ESTÁ SENDO RECEBIDA OU ENVIADA
                      ? Alignment.topLeft
                      : Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 8,
                      left: (!list.mensagens[index]["receveid"]) ? 50 : 0,
                      right: (list.mensagens[index]["receveid"]) ? 50 : 0,
                    ),
                    child: (list.mensagens[index]["loading"])
                        ? list.mensagens[index]["texto"]
                        : BoxCard(
                            color: (list.mensagens[index]["receveid"])
                                ? null
                                : ThemeColors.msgSendColor,
                            widget: Text(list.mensagens[index]["texto"]),
                          ),
                  ),
                );
              }, childCount: list.mensagens.length),
            ),
          ],
        );
      },
    );
  }
}

