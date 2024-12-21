import 'package:tentwenty_assessment/domain/entities/spoken_language.dart';

class SpokenLanguageJson {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguageJson({this.englishName, this.iso6391, this.name});

  SpokenLanguageJson.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['english_name'] = this.englishName;
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    return data;
  }

  SpokenLanguage toDomain() {
    return SpokenLanguage(
      englishName: englishName,
      iso6391: iso6391,
      name: name,
    );
  }
}
