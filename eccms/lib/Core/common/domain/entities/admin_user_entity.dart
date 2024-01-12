import 'package:equatable/equatable.dart';

class GuardianUserEntity extends Equatable {
  final int? employeeId;
  final int? roleId;
  final int? branchId;
  final String? branchName;
  final int? provinceId;
  final String? provinceName;

  const GuardianUserEntity(
      {this.employeeId,
      this.branchId,
      this.branchName,
      this.provinceId,
      this.provinceName,
      this.roleId});

  @override
  List<Object?> get props =>
      [employeeId, branchId, branchName, provinceId, provinceName, roleId];
}
