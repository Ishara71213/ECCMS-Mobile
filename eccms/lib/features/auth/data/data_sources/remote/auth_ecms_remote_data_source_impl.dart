import 'package:eccms/Core/common/entities/user_entity.dart';
import 'package:eccms/features/auth/data/data_sources/remote/auth_eccms_remote_data_source.dart';

class AuthEccmsRemoteDataSourceImpl extends IAuthEccmsRemoteDataSource {
  AuthEccmsRemoteDataSourceImpl();
  @override
  Future<void> getCreateCurrentUser(UserEntity user) {
    // TODO: implement getCreateCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<String> getCurrentUId() {
    // TODO: implement getCurrentUId
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getCurrentUserById() {
    // TODO: implement getCurrentUserById
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() {
    // TODO: implement isSignIn
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(UserEntity user) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(UserEntity user) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
