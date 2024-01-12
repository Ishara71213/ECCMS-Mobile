import 'package:eccms/features/organization/data/data_sources/remote/organization_data_remote_data_source.dart';
import 'package:eccms/features/organization/domain/entities/crime_type_entity.dart';
import 'package:eccms/features/organization/domain/repository/crime_type_repository.dart';

class CrimeTypeRepositoryImpl extends CrimeTypeRepository {
  final OrganizationDataRemoteDataSource remoteDataSource;

  CrimeTypeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CrimeTypeEntity>> getAllCrimeType() async =>
      await remoteDataSource.getAllCrimeType();

  @override
  Future<List<CrimeTypeEntity>> getAllCrimeTypeByInstitutionId(int id) async =>
      await remoteDataSource.getAllCrimeTypeByInstitutionId(id);

  @override
  Future<void> postCrimeType(CrimeTypeEntity entity) async =>
      await remoteDataSource.postCrimeType(entity);
}
