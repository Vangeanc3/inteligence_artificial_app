import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

class BoxCard extends StatelessWidget {
  final Widget widget;
  final Color? color;
  const BoxCard({super.key, required this.widget, this.color});

  Color? escolheCor(BuildContext context) {
    if (color != null) {
      return color;
    }
    return Theme.of(context).cardColor;
    // return ThemeColors.temaWhats3;
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          boxShadow: kElevationToShadow[3],
          borderRadius: BorderRadius.circular(10),
          color: escolheCor(context)),
      child: widget,
    );
  }
}
