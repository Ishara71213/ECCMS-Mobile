import 'dart:convert';

import 'package:eccms/Core/Utils/http_helper.dart';
import 'package:eccms/Core/Utils/utility.dart';
import 'package:eccms/Core/common/domain/entities/user_entity.dart';
import 'package:eccms/Core/constants/storage_keys_const.dart';
import 'package:eccms/features/auth/data/data_sources/remote/auth_eccms_remote_data_source.dart';
import 'package:eccms/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthEccmsRemoteDataSourceImpl extends AuthEccmsRemoteDataSource {
  AuthEccmsRemoteDataSourceImpl();

  @override
  Future<int> getCurrentUId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      int? memberId = prefs.getInt(StorageKeys.memberId);
      return memberId ?? 0;
    } catch (e) {
      Utility.logError(prefs, "User", e.toString());
      rethrow;
    }
  }

  @override
  Future<UserEntity> getCurrentUserById() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      int? memberId = prefs.getInt(StorageKeys.memberId);
      final String url = 'User/$memberId';
      final response = await HttpHelper.get(url, prefs);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        UserModel model = UserModel.fromJson(result);

        UserEntity entity = UserEntity(
            uid: memberId,
            firstName: model.firstName,
            lastName: model.lastName,
            email: model.email,
            nic: model.nic,
            address: model.address,
            mobileNo: model.mobileNo,
            dob: model.dob,
            gender: model.gender,
            status: model.status,
            password: model.password,
            roleId: model.roleId,
            userType: model.userType);
        return entity;
      } else {
        throw Exception("Failed to fetch user");
      }
    } catch (e) {
      Utility.logError(prefs, "User", e.toString());
      rethrow;
    }
  }

  @override
  Future<bool> isSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? memberId = prefs.getInt(StorageKeys.memberId);
    if (memberId != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> signIn(UserEntity entity) async {
    const String url = 'Auth';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      UserModel model =
          UserModel(email: entity.email, password: entity.password);
      var payload = model.toJsonLogin();
      final response = await HttpHelper.post(url, prefs, jsonEncode(payload));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        prefs.setInt(StorageKeys.memberId, result["userId"]);
        prefs.setString(StorageKeys.token, result["token"]);
        return;
      } else {
        throw Exception("Failed to login");
      }
    } catch (e) {
      Utility.logError(prefs, url, e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Future<void> signUp(UserEntity entity) async {
    const String url = 'User/Register';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      UserModel model = UserModel(
          uid: entity.uid,
          firstName: entity.firstName,
          lastName: entity.lastName,
          email: entity.email,
          nic: entity.nic,
          address: entity.address,
          mobileNo: entity.mobileNo,
          dob: entity.dob,
          gender: entity.gender,
          status: entity.status,
          password: entity.password,
          roleId: entity.roleId,
          userType: entity.userType);
      var payload = model.toJsonResigster();
      final response = await HttpHelper.post(url, prefs, jsonEncode(payload));
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception("Failed to create user");
      }
    } catch (e) {
      Utility.logError(prefs, url, e.toString());
      rethrow;
    }
  }
}
