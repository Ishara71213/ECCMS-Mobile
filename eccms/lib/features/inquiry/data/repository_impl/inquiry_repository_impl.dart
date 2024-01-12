import 'package:eccms/features/inquiry/data/data_sources/remote/inquiry/inquiry_remote_data_source.dart';
import 'package:eccms/features/inquiry/domain/entities/inquiry_entity.dart';
import 'package:eccms/features/inquiry/domain/repository/inquiry_repository.dart';

class InquiryRepositoryImpl extends InquiryRepository {
  final InquiryRemoteDataSource remoteDataSource;

  InquiryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<InquiryEntity>> getAllByUserId(int id) async {
    return remoteDataSource.getAllByUserId(id);
  }

  @override
  Future<List<InquiryEntity>> getAllByEmployeeId(int id) async {
    return remoteDataSource.getAllByEmployeeId(id);
  }

  @override
  Future<void> postInquiry(InquiryEntity entity) async {
    return remoteDataSource.postInquiry(entity);
  }

  @override
  Future<List<InquiryEntity>> getAllById(int id) async {
    return remoteDataSource.getAllById(id);
  }
}
