import 'package:eccms/features/organization/domain/entities/province_entity.dart';
import 'package:eccms/features/organization/domain/repository/provinces_repository.dart';

class PostProvinceUsecase {
  final ProvincesRepository _repository;

  PostProvinceUsecase({required ProvincesRepository repository})
      : _repository = repository;

  Future<void> call(ProvinceEntity entity) async {
    return _repository.postProvince(entity);
  }
}
