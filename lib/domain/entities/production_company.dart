import 'package:equatable/equatable.dart';
import 'package:tentwenty_assessment/core/utils/constants.dart';

class ProductionCompany extends Equatable{
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompany({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }
  ProductionCompany.shimmer() {
    id = 000;
    logoPath =kPlaceHolderImage;
    name = "Dummy name";
    originCountry = "Dummy country";
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id,logoPath,name,originCountry];
}
