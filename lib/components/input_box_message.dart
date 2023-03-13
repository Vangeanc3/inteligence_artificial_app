import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

class InputBoxMessage extends StatelessWidget {
  const InputBoxMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              // expands: true,
              minLines: 1,
              maxLines: 4,
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
