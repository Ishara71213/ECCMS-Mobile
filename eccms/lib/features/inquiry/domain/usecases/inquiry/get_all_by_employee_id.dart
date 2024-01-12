import 'package:eccms/features/inquiry/domain/entities/inquiry_entity.dart';
import 'package:eccms/features/inquiry/domain/repository/inquiry_repository.dart';

class GetAllByEmployeeIdUsecase {
  final InquiryRepository _repository;

  GetAllByEmployeeIdUsecase({required InquiryRepository repository})
      : _repository = repository;

  Future<List<InquiryEntity>> call(int id) async {
    return _repository.getAllByEmployeeId(id);
  }
}
