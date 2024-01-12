import 'package:eccms/Core/common/domain/entities/user_entity.dart';
import 'package:eccms/features/auth/domain/repository/Auth_repository.dart';

class SignUpUsecase {
  final AuthRepository _repository;

  SignUpUsecase({required AuthRepository repository})
      : _repository = repository;

  Future<void> call(UserEntity user) async {
    return _repository.signUp(user);
  }
}
