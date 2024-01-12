import 'package:eccms/features/organization/domain/entities/city_entity.dart';

abstract class CityRepository {
  Future<List<CityEntity>> getAllCities();
  Future<void> postCity(CityEntity entity);
}
