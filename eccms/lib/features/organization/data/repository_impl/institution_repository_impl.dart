import 'package:eccms/features/organization/data/data_sources/remote/organization_data_remote_data_source.dart';
import 'package:eccms/features/organization/domain/repository/institution_repository.dart';

class InstitutionRepositoryImpl extends InstitutionRepository {
  final OrganizationDataRemoteDataSource remoteDataSource;

  InstitutionRepositoryImpl({required this.remoteDataSource});
}
