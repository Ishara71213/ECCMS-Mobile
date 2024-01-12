import 'package:eccms/Core/common/domain/entities/user_entity.dart';
import 'package:eccms/features/auth/domain/repository/Auth_repository.dart';

class SignInUsecase {
  final AuthRepository _repository;

  SignInUsecase({required AuthRepository repository})
      : _repository = repository;

  Future<void> call(UserEntity user) async {
    return _repository.signIn(user);
  }
}
