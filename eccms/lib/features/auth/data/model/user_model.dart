import 'package:eccms/Core/common/domain/entities/user_entity.dart';
import 'package:eccms/Core/enum/usertypes.dart';
import 'package:intl/intl.dart';

class UserModel extends UserEntity {
  const UserModel(
      {final int? uid,
      final String? firstName,
      final String? lastName,
      final String? email,
      final String? nic,
      final String? address,
      final String? mobileNo,
      final DateTime? dob,
      final String? gender,
      final String? status,
      final String? password,
      final String? imageUrl,
      final int? roleId,
      final UserType? userType})
      : super(
            uid: uid,
            firstName: firstName,
            lastName: lastName,
            email: email,
            nic: nic,
            dob: dob,
            address: address,
            mobileNo: mobileNo,
            gender: gender,
            status: status,
            password: password,
            imageUrl: imageUrl,
            roleId: roleId,
            userType: userType);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      nic: json['nic'],
      dob: json['dob'] != null && json['dob'] != ""
          ? DateTime.parse(json['dob'])
          : null,
      address: json['address'],
      gender: json['gender'],
      status: json['status'],
      mobileNo: json['mobileNo'],
      password: json['password'],
      imageUrl: json['imageUrl'],
      roleId: json['roleId'],
      userType: json['type'] == 0
          ? UserType.employee
          : json['type'] == 1
              ? UserType.user
              : null,
    );
  }

  Map<String, dynamic> toJsonResigster() {
    return {
      "firstName": firstName ?? "",
      "lastName": lastName ?? "",
      "email": email ?? "",
      "nic": nic ?? "",
      "address": address ?? "",
      "mobileNo": mobileNo ?? "",
      "dob": DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(dob!),
      "gender": gender ?? "",
      "status": status ?? "",
      "password": password ?? "",
      "roleId": roleId,
    };
  }

  Map<String, dynamic> toJsonLogin() {
    return {"username": email ?? "", "password": password ?? ""};
  }
}
