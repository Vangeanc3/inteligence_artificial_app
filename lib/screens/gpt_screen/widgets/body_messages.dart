import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inteligence_artificial_app/data/mensagens.dart';
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
                    child: list.mensagens[index]["text"],
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
