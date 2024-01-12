import 'package:eccms/features/organization/domain/entities/crime_type_entity.dart';

abstract class CrimeTypeRepository {
  Future<List<CrimeTypeEntity>> getAllCrimeType();
  Future<List<CrimeTypeEntity>> getAllCrimeTypeByInstitutionId(int id);
  Future<void> postCrimeType(CrimeTypeEntity entity);
}
