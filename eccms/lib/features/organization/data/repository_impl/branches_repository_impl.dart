import 'package:eccms/features/organization/data/data_sources/remote/organization_data_remote_data_source.dart';
import 'package:eccms/features/organization/domain/entities/branch_entity.dart';
import 'package:eccms/features/organization/domain/repository/branches_repository.dart';

class BranchesRepositoryImpl extends BranchesRepository {
  final OrganizationDataRemoteDataSource remoteDataSource;

  BranchesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<BranchEntity>> getAllBranches() async =>
      remoteDataSource.getAllBranches();

  @override
  Future<List<BranchEntity>> getAllBranchesByInstitutionId(int id) async =>
      remoteDataSource.getAllBranchesByInstitutionId(id);

  @override
  Future<void> postBranch(BranchEntity entity) async =>
      remoteDataSource.postBranch(entity);
}
