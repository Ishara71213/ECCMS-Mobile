import 'package:eccms/features/inquiry/domain/entities/inquiry_entity.dart';

abstract class InquiryRepository {
  Future<List<InquiryEntity>> getAllById(int id);
  Future<List<InquiryEntity>> getAllByUserId(int id);
  Future<List<InquiryEntity>> getAllByEmployeeId(int id);
  Future<void> postInquiry(InquiryEntity entity);
}
