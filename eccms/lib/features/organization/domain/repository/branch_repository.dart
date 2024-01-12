import 'package:eccms/features/organization/domain/entities/branch_entity.dart';

abstract class BranchRepository {
  Future<List<BranchEntity>> getAllBranches();
  Future<List<BranchEntity>> getAllBranchesByInstitutionId(int id);
  Future<void> postBranch(BranchEntity entity);
}
