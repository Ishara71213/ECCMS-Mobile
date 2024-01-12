import 'package:eccms/features/organization/data/data_sources/remote/organization_data_remote_data_source.dart';
import 'package:eccms/features/organization/domain/repository/province_repository.dart';

class ProvinceRepositoryImpl extends ProvinceRepository {
  final OrganizationDataRemoteDataSource remoteDataSource;

  ProvinceRepositoryImpl({required this.remoteDataSource});
}
