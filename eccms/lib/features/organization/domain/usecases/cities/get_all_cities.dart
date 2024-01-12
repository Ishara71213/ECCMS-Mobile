import 'package:eccms/features/organization/domain/entities/city_entity.dart';
import 'package:eccms/features/organization/domain/repository/Cities_repository.dart';

class GetAllCitiesUsecase {
  final CitiesRepository _repository;

  GetAllCitiesUsecase({required CitiesRepository repository})
      : _repository = repository;

  Future<List<CityEntity>> call() async {
    return _repository.getAllCities();
  }
}
