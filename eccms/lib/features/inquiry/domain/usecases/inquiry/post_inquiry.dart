import 'package:eccms/features/inquiry/domain/entities/inquiry_entity.dart';
import 'package:eccms/features/inquiry/domain/repository/inquiry_repository.dart';

class PostInquiryUsecase {
  final InquiryRepository _repository;

  PostInquiryUsecase({required InquiryRepository repository})
      : _repository = repository;

  Future<void> call(InquiryEntity entity) async {
    return _repository.postInquiry(entity);
  }
}
