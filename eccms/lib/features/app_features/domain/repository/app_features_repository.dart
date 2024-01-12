import 'dart:io';

import 'package:eccms/Core/common/domain/entities/user_entity.dart';

abstract class AppFeaturesRepository {
  Future<String> getUserEmailByUid(String uid);
  Future<UserEntity> uploadProfileImage(File image);
  Future<UserEntity> updateProfileData(UserEntity entity);
  // Future<bool> submitPost(InquiryEntity entity);
  // Future<List<InquiryEntity>> getAllPost();
}
