import 'package:eccms/features/organization/domain/entities/crime_type_entity.dart';
import 'package:eccms/features/organization/domain/repository/crime_type_repository.dart';

class GetAllCrimeTypeUsecase {
  final CrimeTypeRepository _repository;

  GetAllCrimeTypeUsecase({required CrimeTypeRepository repository})
      : _repository = repository;

  Future<List<CrimeTypeEntity>> call() async {
    return _repository.getAllCrimeType();
  }
}
