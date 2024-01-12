import 'package:eccms/features/organization/domain/entities/branch_entity.dart';
import 'package:eccms/features/organization/domain/repository/branch_repository.dart';

class GetAllBranchesUsecase {
  final BranchRepository _repository;

  GetAllBranchesUsecase({required BranchRepository repository})
      : _repository = repository;

  Future<List<BranchEntity>> call() async {
    return _repository.getAllBranches();
  }
}
