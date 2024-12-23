import 'package:tentwenty_assessment/domain/entities/belongs_to_collection.dart';

class BelongsToCollectionJson {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollectionJson({this.id, this.name, this.posterPath, this.backdropPath});

  BelongsToCollectionJson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['poster_path'] = this.posterPath;
    data['backdrop_path'] = this.backdropPath;
    return data;
  }
  BelongsToCollection toDomain(){
    return BelongsToCollection(
      id: id,
      name: name,
      posterPath: posterPath,
      backdropPath: backdropPath,
    );
  }
}