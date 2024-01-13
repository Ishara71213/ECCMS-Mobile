import 'package:eccms/features/auth/domain/repository/Auth_repository.dart';

class GetCurrentUIdUsecase {
  final AuthRepository _repository;

  GetCurrentUIdUsecase({required AuthRepository repository})
      : _repository = repository;

  Future<int> call() async {
    return _repository.getCurrentUId();
  }
}
