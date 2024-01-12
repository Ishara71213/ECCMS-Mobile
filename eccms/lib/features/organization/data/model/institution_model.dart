import 'package:eccms/features/organization/domain/entities/institution_entity.dart';

class InstitutionModel extends InstitutionEntity {
  const InstitutionModel({
    required int id,
    required String name,
    required String address,
    required String phoneNumber,
    required String emailAddress,
  }) : super(
          id: id,
          name: name,
          address: address,
          phoneNumber: phoneNumber,
          emailAddress: emailAddress,
        );

  factory InstitutionModel.fromJson(Map<String, dynamic> json) {
    return InstitutionModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      emailAddress: json['emailAddress'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
    };
  }
}
