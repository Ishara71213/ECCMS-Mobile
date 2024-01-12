import 'package:eccms/features/organization/domain/entities/branch_entity.dart';
import 'package:eccms/features/organization/domain/repository/Branches_repository.dart';

class PostBranchUsecase {
  final BranchesRepository _repository;

  PostBranchUsecase({required BranchesRepository repository})
      : _repository = repository;

  Future<void> call(BranchEntity entity) async {
    return _repository.postBranch(entity);
  }
}
