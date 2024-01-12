import 'package:eccms/features/organization/data/data_sources/remote/organization_data_remote_data_source.dart';
import 'package:eccms/features/organization/domain/repository/cities_repository.dart';

class CitiesRepositoryImpl extends CitiesRepository {
  final OrganizationDataRemoteDataSource remoteDataSource;

  CitiesRepositoryImpl({required this.remoteDataSource});
}
