import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/components/input_box_message.dart';

class BodyMessages extends StatelessWidget {
  const BodyMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InputBoxMessage(),
      ],
    );
  }
}
