import 'package:equatable/equatable.dart';
import 'package:tentwenty_assessment/core/utils/constants.dart';

class BelongsToCollection extends Equatable{
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  BelongsToCollection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  BelongsToCollection.shimmer() {
    id = 000;
    name = "Dummy name";
    posterPath = kPlaceHolderImage;
    backdropPath = "dummy url";
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['poster_path'] = this.posterPath;
    data['backdrop_path'] = this.backdropPath;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,posterPath,backdropPath];
}