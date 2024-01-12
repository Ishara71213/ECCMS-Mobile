import 'package:eccms/features/organization/domain/entities/institution_entity.dart';
import 'package:eccms/features/organization/domain/repository/institutions_repository.dart';

class GetAllInstitutionsUsecase {
  final InstitutionsRepository _repository;

  GetAllInstitutionsUsecase({required InstitutionsRepository repository})
      : _repository = repository;

  Future<List<InstitutionEntity>> call() async {
    return _repository.getAllInstitutions();
  }
}
