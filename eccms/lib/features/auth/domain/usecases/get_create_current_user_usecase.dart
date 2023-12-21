import 'package:eccms/Core/common/entities/user_entity.dart';
import 'package:eccms/features/auth/domain/repository/Auth_repository.dart';

class GetCreateCurrentUserUsecase {
  final AuthRepository _repository;

  GetCreateCurrentUserUsecase({required AuthRepository repository})
      : _repository = repository;

  Future<void> call(UserEntity user) async {
    return _repository.getCreateCurrentUser(user);
  }
}
