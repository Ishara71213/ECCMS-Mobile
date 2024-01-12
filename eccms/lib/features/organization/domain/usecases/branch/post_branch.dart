import 'package:eccms/features/organization/domain/entities/branch_entity.dart';
import 'package:eccms/features/organization/domain/repository/branch_repository.dart';

class PostBranchUsecase {
  final BranchRepository _repository;

  PostBranchUsecase({required BranchRepository repository})
      : _repository = repository;

  Future<void> call(BranchEntity entity) async {
    return _repository.postBranch(entity);
  }
}
