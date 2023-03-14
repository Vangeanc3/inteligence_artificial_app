import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/components/box_card.dart';
import 'package:inteligence_artificial_app/data/ia_data.dart';
import 'package:inteligence_artificial_app/screens/chat_gpt_screen/widgets/body_messages.dart';
import 'package:inteligence_artificial_app/themes/my_theme.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

import '../../components/input_box_message.dart';

class GptScreen extends StatefulWidget {
  GptScreen({super.key});
  List<Map<String, dynamic>> boxs = mensagens;

  @override
  State<GptScreen> createState() => _GptScreenState();
}

class _GptScreenState extends State<GptScreen> {
  @override
  void initState() {
    setState(() {
      List<Map<String, dynamic>> boxs = mensagens;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mobile GPT")),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomScrollView(
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
                          widget: Text(widget.boxs[index]["text"]),
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
            ),
          ),
          Positioned(
              left: 8,
              bottom: 0,
              right: 0,
              child: Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: const InputBoxMessage()))
        ],
      ),
    );
  }
}
