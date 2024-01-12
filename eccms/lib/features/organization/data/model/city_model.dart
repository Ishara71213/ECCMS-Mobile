import 'package:eccms/features/organization/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  const CityModel({
    required int id,
    required String name,
    required int provinceId,
  }) : super(id: id, name: name, provinceId: provinceId);

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
      provinceId: json['provinceId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'provinceId': provinceId,
    };
  }
}
