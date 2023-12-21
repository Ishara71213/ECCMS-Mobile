import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? uid;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? nic;
  final String? address;
  final String? mobileNo;
  final String? dob;
  final String? gender;
  final String? status;
  final String? password;
  final String? imageUrl;
  final int? roleId;
  final String? userType;

  const UserEntity(
      {this.uid,
      this.firstName,
      this.lastName,
      this.email,
      this.nic,
      this.address,
      this.mobileNo,
      this.dob,
      this.gender,
      this.status,
      this.password,
      this.imageUrl,
      this.roleId,
      this.userType});

  @override
  // to compair value equality of an instant
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        nic,
        address,
        gender,
        status,
        uid,
        dob,
        status,
        password,
        userType,
        roleId,
        imageUrl
      ];
}
