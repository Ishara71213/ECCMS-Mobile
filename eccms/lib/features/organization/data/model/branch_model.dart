import 'package:eccms/features/organization/domain/entities/branch_entity.dart';

class BranchModel extends BranchEntity {
  const BranchModel({
    required int id,
    required String name,
    required String address,
    required String phoneNumber,
    required String emailAddress,
    required int cityId,
    required int institutionId,
  }) : super(
          id: id,
          name: name,
          address: address,
          phoneNumber: phoneNumber,
          emailAddress: emailAddress,
          cityId: cityId,
          institutionId: institutionId,
        );

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      emailAddress: json['emailAddress'],
      cityId: json['cityId'],
      institutionId: json['institutionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
      'cityId': cityId,
      'institutionId': institutionId,
    };
  }

  factory BranchModel.fromEntity(BranchEntity entity) {
    return BranchModel(
      id: entity.id,
      name: entity.name,
      address: entity.address,
      phoneNumber: entity.phoneNumber,
      emailAddress: entity.emailAddress,
      cityId: entity.cityId,
      institutionId: entity.institutionId,
    );
  }
}
