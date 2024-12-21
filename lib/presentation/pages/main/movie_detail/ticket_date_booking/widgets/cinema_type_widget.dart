import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';
import 'package:tentwenty_assessment/core/utils/assets.dart';

class CinemaTypeWidget extends StatelessWidget {
  final bool isSelected;

  const CinemaTypeWidget({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "12:30",
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              "   Cinetech + hall 1",
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: context.colorTheme.tertiary),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: isSelected
                      ? context.colorTheme.primary
                      : context.colorTheme.tertiary,
                  width: isSelected?1:0.5)),
          child: SvgPicture.asset(Assets.cinema),
        ),
        RichText(
          text: TextSpan(
              text: "From",
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: context.colorTheme.tertiary),
              children: [
                TextSpan(
                    text: " 50\$",
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                TextSpan(
                  text: " or",
                ),
                TextSpan(
                    text: " 2500 bonus",
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ]),
        )
      ],
    );
  }
}
