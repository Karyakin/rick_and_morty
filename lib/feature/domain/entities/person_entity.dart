import 'package:equatable/equatable.dart'; // для того, чтобы можно было сравнивать по значению. Изначально в Dart сравнения идут по ссылка. Нужно переопределить сравнение == и сравнение hash. Это пакет делает это

class PersonEntity extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  //final Location origin;
  //final Location location;
  final String image;
  final List<String> episode;
  final String created;

  PersonEntity(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      // required this.origin,
      //required this.location,
      required this.image,
      required this.episode,
      required this.created});

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        //origin,
        //location,
        image,
        episode,
        created
      ];
}

class Location {
  final String name;
  final String url;
  Location(this.name, this.url);
}
