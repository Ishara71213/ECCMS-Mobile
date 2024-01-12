import 'package:eccms/Core/common/domain/entities/user_entity.dart';
import 'package:eccms/features/auth/domain/repository/Auth_repository.dart';

class GetCurrentUserByUidUsecase {
  final AuthRepository _repository;

  GetCurrentUserByUidUsecase({required AuthRepository repository})
      : _repository = repository;

  Future<UserEntity> call() async {
    return _repository.getCurrentUserById();
  }
}
