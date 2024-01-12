import 'package:eccms/features/organization/domain/entities/institution_entity.dart';
import 'package:eccms/features/organization/domain/repository/Institution_repository.dart';

class GetAllInstitutionsUsecase {
  final InstitutionRepository _repository;

  GetAllInstitutionsUsecase({required InstitutionRepository repository})
      : _repository = repository;

  Future<List<InstitutionEntity>> call() async {
    return _repository.getAllInstitutions();
  }
}
