import 'package:eccms/features/organization/domain/entities/province_entity.dart';
import 'package:eccms/features/organization/domain/repository/Province_repository.dart';

class GetAllProvincesUsecase {
  final ProvinceRepository _repository;

  GetAllProvincesUsecase({required ProvinceRepository repository})
      : _repository = repository;

  Future<List<ProvinceEntity>> call() async {
    return _repository.getAllProvinces();
  }
}
