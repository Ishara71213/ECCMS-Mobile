import 'package:eccms/features/organization/domain/entities/branch_entity.dart';
import 'package:eccms/features/organization/domain/repository/Branches_repository.dart';

class GetAllBranchesUsecase {
  final BranchesRepository _repository;

  GetAllBranchesUsecase({required BranchesRepository repository})
      : _repository = repository;

  Future<List<BranchEntity>> call() async {
    return _repository.getAllBranches();
  }
}
