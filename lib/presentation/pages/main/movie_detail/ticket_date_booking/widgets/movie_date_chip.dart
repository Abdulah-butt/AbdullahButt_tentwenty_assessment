import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';

class MovieDateChip extends StatelessWidget {
  final bool isSelected;
  final DateTime dateTime;
  final Function(DateTime)? onSelectDate;
  const MovieDateChip({
    super.key,
    this.isSelected = false,
    required this.dateTime,
    this.onSelectDate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onSelectDate?.call(dateTime);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: isSelected
                ? context.colorTheme.primary
                : context.colorTheme.tertiary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            DateFormat('dd MMM').format(dateTime),
            style: context.textTheme.bodyMedium?.copyWith(
              color: isSelected
                  ? context.colorTheme.onPrimary
                  : context.colorTheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
