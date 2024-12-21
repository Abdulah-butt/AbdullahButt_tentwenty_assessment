import 'package:tentwenty_assessment/domain/entities/genre.dart';

class GenreJson {
  int? id;
  String? name;

  GenreJson({this.id, this.name});

  GenreJson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
  Genre toDomain(){
    return Genre(
      id: id,
      name: name,
    );
  }
}
