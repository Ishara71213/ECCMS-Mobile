import 'package:eccms/features/auth/domain/repository/Auth_repository.dart';

class IsSignInUsecase {
  final AuthRepository _repository;

  IsSignInUsecase({required AuthRepository repository})
      : _repository = repository;

  Future<bool> call() async {
    return _repository.isSignIn();
  }
}
