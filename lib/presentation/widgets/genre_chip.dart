import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';

class GenreChip extends StatelessWidget {
  final Color? color;
  final String text;
  const GenreChip({super.key, this.color,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Text(
        text,
        style: context.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white
        ),
      ),
    );
  }
}
