import 'package:equatable/equatable.dart';
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
