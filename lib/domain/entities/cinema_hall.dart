import 'package:equatable/equatable.dart';

class CinemaHall extends Equatable {
  String name;
  double price;
  int bonus;
  String time;

  CinemaHall(
      {required this.name, required this.price, required this.bonus, required this.time,});


  @override
  // TODO: implement props
  List<Object?> get props => [name,price,bonus,time];
}