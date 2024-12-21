import 'package:equatable/equatable.dart';

class ProductionCountry extends Equatable{
  String? iso31661;
  String? name;

  ProductionCountry({this.iso31661, this.name});

  ProductionCountry.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  ProductionCountry.shimmer() {
    iso31661 = "dummy value";
    name = "dummy value";
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    return data;
  }


  @override
  // TODO: implement props
  List<Object?> get props => [iso31661,name];
}