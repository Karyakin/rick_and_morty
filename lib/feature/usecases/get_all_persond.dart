import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/usecases/use_case.dart';
import 'package:rick_and_morty/feature/domain/repositories/personal_repository.dart';

import '../../../core/failure.dart';
import '../domain/entities/person_entity.dart';

class GetAllPersons extends UseCase<List<PersonEntity>, PagePersonPatams> {
  final PersonRepository personRepository;

  GetAllPersons(this.personRepository);

  Future<Either<Failure, List<PersonEntity>>> call(
      PagePersonPatams params) async {
    return await personRepository.getAllPersons(params.page);
  }
}

class PagePersonPatams extends Equatable {
  final int page;

  PagePersonPatams({required this.page});
  @override
  List<Object?> get props => [page];
}
