import 'package:eccms/features/organization/domain/entities/province_entity.dart';

abstract class ProvinceRepository {
  Future<List<ProvinceEntity>> getAllProvinces();
  Future<void> postProvince(ProvinceEntity entity);
}
