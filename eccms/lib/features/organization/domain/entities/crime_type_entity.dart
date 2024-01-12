import 'package:equatable/equatable.dart';

class CrimeTypeEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final int crimeLevel;
  final int averageResponseHours;
  final int institutionId;

  const CrimeTypeEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.crimeLevel,
    required this.averageResponseHours,
    required this.institutionId,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        crimeLevel,
        averageResponseHours,
        institutionId,
      ];
}
