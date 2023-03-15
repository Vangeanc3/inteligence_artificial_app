import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inteligence_artificial_app/components/box_card.dart';
import 'package:inteligence_artificial_app/data/ia_data.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

import '../../components/input_box_message.dart';

class GptScreen extends StatefulWidget {
  GptScreen({super.key});
  List<Map<String, dynamic>> boxs = mensagens;
  bool reloadBool = true;

  @override
  State<GptScreen> createState() => _GptScreenState();
}

class _GptScreenState extends State<GptScreen> {
  reloadFunction() {
    setState(() {
      widget.reloadBool = !widget.reloadBool;
    });
    Map<String, dynamic> mapRequest = {
      "text": "",
      "receveid": true,
      "loading": true
    };
    
    mensagens.add(mapRequest);
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
                          widget: (widget.boxs[index]["loading"])
                              ? ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 35),
                                  child: const SpinKitThreeBounce(
                                      color: Colors.white, size: 10.0),
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
            ),
          ),
          Positioned(
              left: 8,
              bottom: 0,
              right: 0,
              child: Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: InputBoxMessage(
                    childChanged: reloadFunction,
                  )))
        ],
      ),
    );
  }
}
