import 'package:eccms/Core/common/entities/user_entity.dart';

abstract class AuthRepository {
  Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<String> getCurrentUId();
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<UserEntity> getCurrentUserById();
}
