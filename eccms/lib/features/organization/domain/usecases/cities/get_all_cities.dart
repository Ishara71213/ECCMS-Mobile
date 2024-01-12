import 'package:eccms/features/organization/domain/entities/city_entity.dart';
import 'package:eccms/features/organization/domain/repository/city_repository.dart';

class GetAllCitiesUsecase {
  final CityRepository _repository;

  GetAllCitiesUsecase({required CityRepository repository})
      : _repository = repository;

  Future<List<CityEntity>> call() async {
    return _repository.getAllCities();
  }
}
