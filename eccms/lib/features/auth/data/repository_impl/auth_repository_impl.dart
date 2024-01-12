import 'package:eccms/Core/common/domain/entities/user_entity.dart';
import 'package:eccms/features/auth/data/data_sources/remote/auth_eccms_remote_data_source.dart';
import 'package:eccms/features/auth/domain/repository/Auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthEccmsRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> getCurrentUserById() async =>
      remoteDataSource.getCurrentUserById();

  @override
  Future<String> getCurrentUId() async => remoteDataSource.getCurrentUId();

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

  @override
  Future<void> signIn(UserEntity user) async => remoteDataSource.signIn(user);

  @override
  Future<void> signOut() async => remoteDataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) async => remoteDataSource.signUp(user);
}
