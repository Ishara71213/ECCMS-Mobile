import 'package:eccms/features/organization/domain/entities/branch_entity.dart';
import 'package:eccms/features/organization/domain/repository/Branches_repository.dart';

class GetAllBranchesByInstitutionIdUsecase {
  final BranchesRepository _repository;

  GetAllBranchesByInstitutionIdUsecase({required BranchesRepository repository})
      : _repository = repository;

  Future<List<BranchEntity>> call(int institutionId) async {
    return _repository.getAllBranchesByInstitutionId(institutionId);
  }
}
