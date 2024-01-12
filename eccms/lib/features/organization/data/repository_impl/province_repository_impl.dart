import 'package:eccms/features/organization/data/data_sources/remote/organization_data_remote_data_source.dart';
import 'package:eccms/features/organization/domain/entities/province_entity.dart';
import 'package:eccms/features/organization/domain/repository/provinces_repository.dart';

class ProvinceRepositoryImpl extends ProvincesRepository {
  final OrganizationDataRemoteDataSource remoteDataSource;

  ProvinceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ProvinceEntity>> getAllProvinces() async =>
      await remoteDataSource.getAllProvinces();

  @override
  Future<void> postProvince(ProvinceEntity entity) async =>
      await remoteDataSource.postProvince(entity);
}
