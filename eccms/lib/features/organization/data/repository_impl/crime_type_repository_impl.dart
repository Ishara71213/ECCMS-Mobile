import 'package:eccms/features/organization/data/data_sources/remote/organization_data_remote_data_source.dart';
import 'package:eccms/features/organization/domain/repository/crime_type_repository.dart';

class CrimeTypeRepositoryImpl extends CrimeTypeRepository {
  final OrganizationDataRemoteDataSource remoteDataSource;

  CrimeTypeRepositoryImpl({required this.remoteDataSource});
}
