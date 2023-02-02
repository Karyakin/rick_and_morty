import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';

class LocationModel extends Location {
  LocationModel({name, url}) : super('name', 'url');

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(name: json['name'], url: json['url']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url};
  }
}