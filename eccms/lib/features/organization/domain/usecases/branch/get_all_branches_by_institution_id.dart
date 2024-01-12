import 'package:eccms/features/organization/domain/entities/branch_entity.dart';
import 'package:eccms/features/organization/domain/repository/branch_repository.dart';

class GetAllBranchesByInstitutionIdUsecase {
  final BranchRepository _repository;

  GetAllBranchesByInstitutionIdUsecase({required BranchRepository repository})
      : _repository = repository;

  Future<List<BranchEntity>> call(int institutionId) async {
    return _repository.getAllBranchesByInstitutionId(institutionId);
  }
}
