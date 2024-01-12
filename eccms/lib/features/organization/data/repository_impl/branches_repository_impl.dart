import 'package:eccms/features/organization/data/data_sources/remote/organization_data_remote_data_source.dart';
import 'package:eccms/features/organization/domain/repository/branches_repository.dart';

class BranchesRepositoryImpl extends BranchesRepository {
  final OrganizationDataRemoteDataSource remoteDataSource;

  BranchesRepositoryImpl({required this.remoteDataSource});
}
