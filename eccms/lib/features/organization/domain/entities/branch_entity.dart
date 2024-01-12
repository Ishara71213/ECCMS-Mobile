import 'package:equatable/equatable.dart';

class BranchEntity extends Equatable {
  final int id;
  final String name;
  final String address;
  final String phoneNumber;
  final String emailAddress;
  final int cityId;
  final int institutionId;

  const BranchEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.emailAddress,
    required this.cityId,
    required this.institutionId,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        phoneNumber,
        emailAddress,
        cityId,
        institutionId,
      ];
}
