import 'package:eccms/Core/common/domain/entities/user_entity.dart';

abstract class AuthEccmsRemoteDataSource {
  Future<bool> isSignIn();
  Future<void> signIn(UserEntity entity);
  Future<void> signUp(UserEntity entity);
  Future<void> signOut();
  Future<String> getCurrentUId();
  Future<void> getCreateCurrentUser(UserEntity entity);
  Future<UserEntity> getCurrentUserById();
}
