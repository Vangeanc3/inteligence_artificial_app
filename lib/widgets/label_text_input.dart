import 'package:flutter/material.dart';

import '../utils/form_validator_helper.dart';

class LabelTextInput extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final IconData icon;
  final TextEditingController controllerField;

  const LabelTextInput(
      {super.key,
      required this.hintText,
      required this.isPassword,
      required this.icon,
      required this.controllerField});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        Expanded(
          child: Container(
            child: TextFormField(
              validator: (value) {
                if (validarValor(value)) {
                  return "Insira o valor correto";
                } else {
                  return null;
                }
              },
              controller: controllerField,
              obscureText: isPassword,
              cursorColor: Colors.white,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xffc5d2e1),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
