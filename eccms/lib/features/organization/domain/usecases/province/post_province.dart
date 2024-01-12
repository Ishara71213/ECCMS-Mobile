import 'package:eccms/features/organization/domain/entities/province_entity.dart';
import 'package:eccms/features/organization/domain/repository/Province_repository.dart';

class PostProvinceUsecase {
  final ProvinceRepository _repository;

  PostProvinceUsecase({required ProvinceRepository repository})
      : _repository = repository;

  Future<void> call(ProvinceEntity entity) async {
    return _repository.postProvince(entity);
  }
}
