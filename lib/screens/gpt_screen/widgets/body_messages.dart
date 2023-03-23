import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inteligence_artificial_app/data/mensagens.dart';
import 'package:inteligence_artificial_app/models/chat_gpt.dart';
import 'package:inteligence_artificial_app/services/chat_gpt_service.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

import '../../../components/box_card.dart';

class BodyMessages extends StatefulWidget {
  const BodyMessages({super.key});

  @override
  State<BodyMessages> createState() => _BodyMessagesState();
}

class _BodyMessagesState extends State<BodyMessages> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Mensagens>(
      builder: (context, list, child) {
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Align(
                  alignment: (list.mensagens[index]["receveid"])
                      ? Alignment.topLeft
                      : Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 8,
                      left: (!list.mensagens[index]["receveid"]) ? 50 : 0,
                      right: (list.mensagens[index]["receveid"]) ? 50 : 0,
                    ),
                    child: BoxCard(
                      widget: (list.mensagens[index]["receveid"])
                          ? ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 35),
                              child: const SpinKitThreeBounce(
                                  color: Colors.white, size: 10.0),
                            )
                          : Text(list.mensagens[index]["text"]),
                      color: (list.mensagens[index]["receveid"])
                          ? null
                          : ThemeColors.msgSendColor,
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
