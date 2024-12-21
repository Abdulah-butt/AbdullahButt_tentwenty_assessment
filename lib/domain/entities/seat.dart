import 'package:equatable/equatable.dart';
import 'package:tentwenty_assessment/core/enums/seat_status.dart';

class Seat extends Equatable {
  int lineNo;
  int seatNo;

  Seat({required this.seatNo, required this.lineNo,});

  @override
  // TODO: implement props
  List<Object?> get props => [
        seatNo,
        lineNo,
      ];
}
