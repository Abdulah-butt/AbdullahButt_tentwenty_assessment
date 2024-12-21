import 'package:flutter/material.dart';
import '../../../core/extensions/theme_extension.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final bool isDisabled;
  final bool isLoading;
  final bool isSecondary;
  final double? width;
  final double? height;
  final Widget? icon;

  const CustomButton({
    super.key,
    this.onTap,
    this.text,
    this.isDisabled = false,
    this.isLoading = false,
    this.isSecondary = false,
    this.height,
    this.width,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : ElevatedButton.icon(
            icon: icon,
            iconAlignment: IconAlignment.start,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width ?? context.sw, height ?? 45),
              maximumSize: Size(width ?? context.sw, height ?? 55),
              side: isSecondary
                  ? BorderSide(
                color: context.themeData.colorScheme.primary,
                width: 2.0,
              )
                  : BorderSide.none,
              backgroundColor: isDisabled
                  ? Colors.grey.shade300
                  : isSecondary
                      ? Colors.transparent
                      : null,
              // Set the disabled background color
              foregroundColor: isDisabled
                  ? Colors.grey.shade500
                  : isSecondary
                      ? context.themeData.colorScheme.onSecondary
                      : null, // Set the disabled text color
            ),
            onPressed: isDisabled ? null : onTap,
            label: Text(text ?? ""),
          );
  }
}
