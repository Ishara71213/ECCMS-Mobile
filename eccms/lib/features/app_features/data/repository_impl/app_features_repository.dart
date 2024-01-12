import 'dart:io';

import 'package:eccms/Core/common/domain/entities/user_entity.dart';
import 'package:eccms/features/app_features/domain/repository/app_features_repository.dart';

class AppFeaturesRepositoryImpl extends AppFeaturesRepository {
  @override
  Future<String> getUserEmailByUid(String uid) {
    // TODO: implement getUserEmailByUid
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> updateProfileData(UserEntity entity) {
    // TODO: implement updateProfileData
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> uploadProfileImage(File image) {
    // TODO: implement uploadProfileImage
    throw UnimplementedError();
  }
}
