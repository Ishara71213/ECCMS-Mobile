import 'package:eccms/features/inquiry/data/data_sources/remote/inquiry/inquiry_remote_data_source.dart';
import 'package:eccms/features/inquiry/domain/repository/inquiry_repository.dart';

class InquiryRepositoryImpl extends InquiryRepository {
  final InquiryRemoteDataSource remoteDataSource;

  InquiryRepositoryImpl({required this.remoteDataSource});
}
