import 'dart:io';

import 'package:eccms/Core/common/domain/entities/user_entity.dart';
import 'package:eccms/features/app_features/domain/repository/app_features_repository.dart';

class UpdateProfileImageUsecase {
  final AppFeaturesRepository _repository;

  UpdateProfileImageUsecase({required AppFeaturesRepository repository})
      : _repository = repository;

  Future<UserEntity> call(File image) async {
    return await _repository.uploadProfileImage(image);
  }
}
