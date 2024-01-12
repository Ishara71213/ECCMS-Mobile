import 'package:eccms/features/organization/domain/entities/crime_type_entity.dart';

class CrimeTypeModel extends CrimeTypeEntity {
  const CrimeTypeModel({
    required int id,
    required String name,
    required String description,
    required int crimeLevel,
    required int averageResponseHours,
    required int institutionId,
  }) : super(
          id: id,
          name: name,
          description: description,
          crimeLevel: crimeLevel,
          averageResponseHours: averageResponseHours,
          institutionId: institutionId,
        );

  factory CrimeTypeModel.fromJson(Map<String, dynamic> json) {
    return CrimeTypeModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      crimeLevel: json['crimeLevel'],
      averageResponseHours: json['averageResponseHours'],
      institutionId: json['institutionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'crimeLevel': crimeLevel,
      'averageResponseHours': averageResponseHours,
      'institutionId': institutionId,
    };
  }

  factory CrimeTypeModel.fromEntity(CrimeTypeEntity entity) {
    return CrimeTypeModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      crimeLevel: entity.crimeLevel,
      averageResponseHours: entity.averageResponseHours,
      institutionId: entity.institutionId,
    );
  }
}
