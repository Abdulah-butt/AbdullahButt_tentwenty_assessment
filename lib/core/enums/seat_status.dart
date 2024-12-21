import 'package:flutter/material.dart';

enum SeatStatus {
  selected("Selected", Color(0xffCD9D0F)),
  notAvailable("Not Available", Colors.grey),
  vip("VIP", Color(0xff564CA3)),
  regular("Regular", Colors.blue);

  final String name;
  final Color color;

  const SeatStatus(this.name, this.color);
}
