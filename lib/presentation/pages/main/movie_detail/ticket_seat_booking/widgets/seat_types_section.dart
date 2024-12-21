import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';
import 'package:tentwenty_assessment/core/utils/assets.dart';
class SeatTypesSection extends StatelessWidget {
  const SeatTypesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            _seatType(text: "Selected",color: Color(0xffCD9D0F),context: context),
            _seatType(text: "Not available",context: context),
          ],
        ),
        SizedBox(height: 15,),
        Row(
          children: [
            _seatType(text: "VIP (150\$)",context: context,color: Color(0xff564CA3)),
            _seatType(text: "Regular (50\$)",context: context,color: Color(0xff61C3F2)),

          ],
        ),

      ],
    );
  }

  Widget _seatType({required BuildContext context,String? text,Color? color}){
    return Expanded(
      flex: 5,
      child: Row(
        children: [
          SvgPicture.asset(Assets.seat,color: color,),
          SizedBox(width: 10,),
          Text("$text",style: context.textTheme.bodySmall,)
        ],
      ),
    );
  }
}
