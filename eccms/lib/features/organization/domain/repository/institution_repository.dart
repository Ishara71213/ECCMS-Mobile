import 'package:eccms/features/organization/domain/entities/institution_entity.dart';

abstract class InstitutionRepository {
  Future<List<InstitutionEntity>> getAllInstitutions();
  Future<InstitutionEntity> getInstitutionById(int id);
}
