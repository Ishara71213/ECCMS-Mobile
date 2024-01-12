import 'package:eccms/features/organization/domain/entities/city_entity.dart';
import 'package:eccms/features/organization/domain/repository/city_repository.dart';

class PostCityUsecase {
  final CityRepository _repository;

  PostCityUsecase({required CityRepository repository})
      : _repository = repository;

  Future<void> call(CityEntity entity) async {
    return _repository.postCity(entity);
  }
}
