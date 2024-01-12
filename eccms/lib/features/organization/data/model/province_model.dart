import 'package:eccms/features/organization/domain/entities/province_entity.dart';

class ProvinceModel extends ProvinceEntity {
  const ProvinceModel({
    required int id,
    required String name,
  }) : super(id: id, name: name);

  factory ProvinceModel.fromJson(Map<String, dynamic> json) {
    return ProvinceModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
