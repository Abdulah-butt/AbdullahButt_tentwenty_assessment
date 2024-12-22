import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';
import 'package:tentwenty_assessment/domain/entities/seat.dart';

class SelectedSeatChip extends StatelessWidget {
  final Seat seat;
  final Function(Seat)? onRemove;

  const SelectedSeatChip({super.key,required this.seat,this.onRemove});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        onRemove?.call(seat);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        decoration: BoxDecoration(
          color: context.colorTheme.surfaceDim,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${seat.lineNo} /${seat.seatNo}"),
            IconButton(onPressed: (){
              onRemove?.call(seat);
            }, icon: Icon(Icons.close))
          ],
        ),
      ),
    );
  }
}
