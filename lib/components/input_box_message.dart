import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

class InputBoxMessage extends StatelessWidget {
  const InputBoxMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            width: 250,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              expands: true,
              minLines: null,
              maxLines: null,
              decoration: const InputDecoration(hintText: "Sua dúvida"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 10),
            child: Container(
              decoration: BoxDecoration(
                color: ThemeColors.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: const Icon(Icons.send_rounded),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
