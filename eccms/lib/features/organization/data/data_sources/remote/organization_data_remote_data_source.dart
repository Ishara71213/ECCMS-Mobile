import 'package:eccms/features/organization/domain/entities/branch_entity.dart';
import 'package:eccms/features/organization/domain/entities/city_entity.dart';
import 'package:eccms/features/organization/domain/entities/crime_type_entity.dart';
import 'package:eccms/features/organization/domain/entities/institution_entity.dart';
import 'package:eccms/features/organization/domain/entities/province_entity.dart';

abstract class OrganizationDataRemoteDataSource {
  //institution
  Future<List<InstitutionEntity>> getAllInstitutions();
  Future<InstitutionEntity> getInstitutionById(int id);
  //provinces
  Future<List<ProvinceEntity>> getAllProvinces();
  Future<void> postProvince(ProvinceEntity entity);
  //cities
  Future<List<CityEntity>> getAllCities();
  Future<void> postCity(CityEntity entity);
  //branches
  Future<List<BranchEntity>> getAllBranches();
  Future<List<BranchEntity>> getAllBranchesByInstitutionId(int id);
  Future<void> postBranch(BranchEntity entity);
  //crime types
  Future<List<CrimeTypeEntity>> getAllCrimeType();
  Future<List<CrimeTypeEntity>> getAllCrimeTypeByInstitutionId(int id);
  Future<void> postCrimeType(CrimeTypeEntity entity);
}
