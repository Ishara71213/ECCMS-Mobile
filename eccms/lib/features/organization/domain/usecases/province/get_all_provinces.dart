import 'package:eccms/features/organization/domain/entities/province_entity.dart';
import 'package:eccms/features/organization/domain/repository/provinces_repository.dart';

class GetAllProvincesUsecase {
  final ProvincesRepository _repository;

  GetAllProvincesUsecase({required ProvincesRepository repository})
      : _repository = repository;

  Future<List<ProvinceEntity>> call() async {
    return _repository.getAllProvinces();
  }
}
