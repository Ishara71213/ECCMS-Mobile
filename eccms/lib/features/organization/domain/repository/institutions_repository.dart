import 'package:eccms/features/organization/domain/entities/institution_entity.dart';

abstract class InstitutionsRepository {
  Future<List<InstitutionEntity>> getAllInstitutions();
  Future<InstitutionEntity> getInstitutionById(int id);
}
