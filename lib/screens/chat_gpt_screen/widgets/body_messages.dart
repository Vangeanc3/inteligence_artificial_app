import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../components/box_card.dart';

class BodyMessages extends StatelessWidget {
  const BodyMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        Row(
          children: const [
            LimitedBox(
              maxWidth: 300,
              child: Padding(
                padding: EdgeInsets.only(right: 25, bottom: 10),
                child: BoxCard(widget: Text("Olá, como posso ajudar você?")),
              ),
            ),
          ],
        ),
        Row(
          children: const [
            LimitedBox(
              maxWidth: 125,
              child: Padding(
                padding: EdgeInsets.only(right: 50, bottom: 10),
                child: BoxCard(
                    widget: SpinKitThreeBounce(
                  color: Colors.white,
                  size: 20.0,
                )),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            LimitedBox(
              maxWidth: 125,
              child: Padding(
                padding: EdgeInsets.only(left: 50, bottom: 10),
                child: BoxCard(
                    widget: SpinKitThreeBounce(
                  color: Colors.white,
                  size: 20.0,
                )),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
