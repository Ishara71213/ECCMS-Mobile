import 'package:eccms/features/organization/domain/entities/crime_type_entity.dart';
import 'package:eccms/features/organization/domain/repository/crime_type_repository.dart';

class GetAllCrimeTypeByInstitutionIdUsecase {
  final CrimeTypeRepository _repository;

  GetAllCrimeTypeByInstitutionIdUsecase(
      {required CrimeTypeRepository repository})
      : _repository = repository;

  Future<List<CrimeTypeEntity>> call(int institutionId) async {
    return _repository.getAllCrimeTypeByInstitutionId(institutionId);
  }
}
