import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inteligence_artificial_app/data/ia_data.dart';
import 'package:inteligence_artificial_app/models/chat_gpt.dart';
import 'package:inteligence_artificial_app/services/chat_gpt_service.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';
import '../../../components/box_card.dart';

class BodyMessages extends StatefulWidget {
  BodyMessages({super.key, required this.chatGpt});
  final ChatGpt chatGpt;
  List<Map<String, dynamic>> boxs = mensagens;

  @override
  State<BodyMessages> createState() => _BodyMessagesState();
}

class _BodyMessagesState extends State<BodyMessages> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Align(
              alignment: (widget.boxs[index]["receveid"])
                  ? Alignment.topLeft
                  : Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 8,
                  left: (!widget.boxs[index]["receveid"]) ? 50 : 0,
                  right: (widget.boxs[index]["receveid"]) ? 50 : 0,
                ),
                child: BoxCard(
                  widget: (widget.boxs[index]["loading"])
                      ? FutureBuilder(
                          future:
                              ChatGptService().buscarResposta(widget.chatGpt),
                          builder: (context, AsyncSnapshot snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                                return const SpinKitThreeBounce(
                                  color: Colors.white,
                                  size: 10,
                                );
                                break;
                              case ConnectionState.waiting:
                                return const SpinKitThreeBounce(
                                  color: Colors.white,
                                  size: 10,
                                );
                                break;
                              case ConnectionState.active:
                                return const SpinKitThreeBounce(
                                  color: Colors.white,
                                  size: 10,
                                );
                                break;
                              case ConnectionState.done:
                                return Text(snapshot.data);
                                break;
                            }
                            return Container();
                          },
                        )
                      : Text(widget.boxs[index]["text"]),
                  receveid: widget.boxs[index]["receveid"],
                  color: (widget.boxs[index]["receveid"])
                      ? null
                      : ThemeColors.msgSendColor,
                ),
              ),
            );
          }, childCount: widget.boxs.length),
        ),
      ],
    );
  }
}
