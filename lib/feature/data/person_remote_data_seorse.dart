import 'dart:convert';

import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/feature/models/person_models.dart';
import 'package:http/http.dart' as http;

abstract class PersonRemoteDataSerce {
  ///https://rickandmortyapi.com/api/character/?page=2
  /// [ServerException]
  Future<List<PersonModel>> getAllPersons(int pafe);

  ///https://rickandmortyapi.com/api/character/?name=rick&status=alive
  /// [ServerException]
  Future<List<PersonModel>> searchPerson(String query);
}

class PersonRemoteDataSourseImpl implements PersonRemoteDataSerce {
  final http.Client client;

  PersonRemoteDataSourseImpl({required this.client});

  @override
  Future<List<PersonModel>> getAllPersons(int page) async {
    String requestUrl = 'https://rickandmortyapi.com/api/character/?page=$page';

    return await _getPersonFromUrl(requestUrl);
  }

  @override
  Future<List<PersonModel>> searchPerson(String query) async {
    String requestUrl =
        'https://rickandmortyapi.com/api/character/?name=$query';

    return await _getPersonFromUrl(requestUrl);
  }

  Future<List<PersonModel>> _getPersonFromUrl(String url) async {
    print(url);

    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final person = json.decode(response.body);

      //return (response['result'] as List).map((person) => PersonModel.fromJson(person)).toList();
      return (response as List)
          .map((person) => PersonModel.fromJson(person))
          .toList(); // ошибка нужно вставлять закоментированную строку
    } else {
      throw ServerException();
    }
  }
}
