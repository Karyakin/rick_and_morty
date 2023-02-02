import 'dart:convert';

import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/feature/models/person_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonLocalDataSourse {
  /// Gets the cashed [List<PersonModel>] wich was gotten the last time
  /// the user had an internet connection.
  ///
  /// Trows [CasheException] if no cached data is present.
  Future<List<PersonModel>> getLastPersonsFromCash();
  Future<void> getLastPersonsToCash(List<PersonModel> personModel);
}

const CASHED_PERSONS_LIST = 'CASHED_PERSONS_LIST';

class PersonLocalDataSourseImpl implements PersonLocalDataSourse {
  final SharedPreferences sharedPreferences;

  PersonLocalDataSourseImpl({required this.sharedPreferences});

  @override
  Future<List<PersonModel>> getLastPersonsFromCash() {
    final jsonPersenseList =
        sharedPreferences.getStringList(CASHED_PERSONS_LIST);

    if (jsonPersenseList != null && jsonPersenseList.isNotEmpty) {
      return Future.value(jsonPersenseList
          .map((person) => PersonModel.fromJson(json.decode(person)))
          .toList());
    } else {
      throw CashException();
    }
  }

  @override
  Future<void> getLastPersonsToCash(List<PersonModel> persons) {
    final List<String> jsonsPersonsList =
        persons.map((person) => json.encode(person.toJson())).toList();

    sharedPreferences.setStringList(CASHED_PERSONS_LIST, jsonsPersonsList);
    print('Persons to write Cash: ${jsonsPersonsList.length}');
    return Future.value(jsonsPersonsList);
  }
}
