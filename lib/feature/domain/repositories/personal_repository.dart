import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import '../../../core/failure.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(
      int page); // future == Asinc
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query);
}


// для перехватки ошибок
//Either<L,R>
//Either<Failue,Entity>
//Either<Ошибка,Сущность>