import 'package:eccms/features/organization/domain/entities/institution_entity.dart';
import 'package:eccms/features/organization/domain/repository/institutions_repository.dart';

class GetInstitutionByIdUsecase {
  final InstitutionsRepository _repository;

  GetInstitutionByIdUsecase({required InstitutionsRepository repository})
      : _repository = repository;

  Future<InstitutionEntity> call(int id) async {
    return _repository.getInstitutionById(id);
  }
}
