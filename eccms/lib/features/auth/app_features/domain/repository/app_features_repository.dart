import 'dart:io';

import 'package:eccms/Core/common/entities/user_entity.dart';

abstract class AppFeaturesRepository {
  Future<String> getCurrentUId();
  Future<String> getUserIdByEmail(String email);
  Future<String> getUserEmailByUid(String uid);
  Future<UserEntity> uploadProfileImage(File image);
  Future<UserEntity> updateProfileData(UserEntity entity);
  Future<String> uploadImage(File image, String fileType);
  // Future<bool> submitPost(InquiryEntity entity);
  // Future<List<InquiryEntity>> getAllPost();
}
