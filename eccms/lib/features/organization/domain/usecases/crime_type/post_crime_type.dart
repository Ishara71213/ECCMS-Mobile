import 'package:eccms/features/organization/domain/entities/crime_type_entity.dart';
import 'package:eccms/features/organization/domain/repository/crime_type_repository.dart';

class PostCrimeTypeUsecase {
  final CrimeTypeRepository _repository;

  PostCrimeTypeUsecase({required CrimeTypeRepository repository})
      : _repository = repository;

  Future<void> call(CrimeTypeEntity entity) async {
    return _repository.postCrimeType(entity);
  }
}
