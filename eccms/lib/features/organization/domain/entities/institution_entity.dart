import 'package:equatable/equatable.dart';

class InstitutionEntity extends Equatable {
  final int id;
  final String name;
  final String address;
  final String phoneNumber;
  final String emailAddress;

  const InstitutionEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.emailAddress,
  });

  @override
  List<Object?> get props => [id, name, address, phoneNumber, emailAddress];
}
