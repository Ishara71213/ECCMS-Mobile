import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final int id;
  final String name;
  final int provinceId;

  const CityEntity({
    required this.id,
    required this.name,
    required this.provinceId,
  });

  @override
  List<Object?> get props => [id, name, provinceId];
}
