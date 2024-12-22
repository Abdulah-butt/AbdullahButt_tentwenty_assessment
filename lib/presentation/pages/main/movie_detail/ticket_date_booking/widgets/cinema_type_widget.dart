import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';
import 'package:tentwenty_assessment/core/utils/assets.dart';
import 'package:tentwenty_assessment/domain/entities/cinema_hall.dart';

class CinemaTypeWidget extends StatelessWidget {
  final CinemaHall cinemaHall;
  final Function(CinemaHall) onTap;

  final bool isSelected;

  const CinemaTypeWidget({
    super.key,
    this.isSelected = false,
    required this.cinemaHall,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap.call(cinemaHall);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "${cinemaHall.time}  ",
                style: context.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                cinemaHall.name,
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
                    width: isSelected ? 1.5 : 0.5)),
            child: SvgPicture.asset(Assets.cinema),
          ),
          RichText(
            text: TextSpan(
                text: "From",
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: context.colorTheme.tertiary),
                children: [
                  TextSpan(
                      text: " ${cinemaHall.price}\$",
                      style: context.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: " or",
                  ),
                  TextSpan(
                      text: " ${cinemaHall.bonus} bonus",
                      style: context.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ]),
          )
        ],
      ),
    );
  }
}
