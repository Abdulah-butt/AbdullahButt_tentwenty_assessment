import 'package:tentwenty_assessment/domain/entities/production_country.dart';

class ProductionCountryJson {
  String? iso31661;
  String? name;

  ProductionCountryJson({this.iso31661, this.name});

  ProductionCountryJson.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    return data;
  }
  ProductionCountry toDomain(){
    return ProductionCountry(
      iso31661: iso31661,
      name: name
    );
  }
}