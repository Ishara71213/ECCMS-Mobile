import 'package:eccms/features/organization/domain/entities/institution_entity.dart';
import 'package:eccms/features/organization/domain/repository/Institution_repository.dart';

class GetInstitutionByIdUsecase {
  final InstitutionRepository _repository;

  GetInstitutionByIdUsecase({required InstitutionRepository repository})
      : _repository = repository;

  Future<InstitutionEntity> call(int id) async {
    return _repository.getInstitutionById(id);
  }
}
