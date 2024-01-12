import 'package:eccms/features/organization/domain/entities/branch_entity.dart';

abstract class BranchesRepository {
  Future<List<BranchEntity>> getAllBranches();
  Future<List<BranchEntity>> getAllBranchesByInstitutionId(int id);
  Future<void> postBranch(BranchEntity entity);
}
