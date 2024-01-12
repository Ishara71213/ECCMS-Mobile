import 'package:eccms/features/organization/domain/entities/city_entity.dart';
import 'package:eccms/features/organization/domain/repository/Cities_repository.dart';

class PostCityUsecase {
  final CitiesRepository _repository;

  PostCityUsecase({required CitiesRepository repository})
      : _repository = repository;

  Future<void> call(CityEntity entity) async {
    return _repository.postCity(entity);
  }
}
