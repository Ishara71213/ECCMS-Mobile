import 'package:eccms/features/organization/data/data_sources/remote/organization_data_remote_data_source.dart';
import 'package:eccms/features/organization/domain/entities/institution_entity.dart';
import 'package:eccms/features/organization/domain/repository/institutions_repository.dart';

class InstitutionRepositoryImpl extends InstitutionsRepository {
  final OrganizationDataRemoteDataSource remoteDataSource;

  InstitutionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<InstitutionEntity>> getAllInstitutions() async =>
      await remoteDataSource.getAllInstitutions();

  @override
  Future<InstitutionEntity> getInstitutionById(int id) async =>
      await remoteDataSource.getInstitutionById(id);
}
