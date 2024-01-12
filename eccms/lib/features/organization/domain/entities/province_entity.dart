import 'package:equatable/equatable.dart';

class ProvinceEntity extends Equatable {
  final int id;
  final String name;

  const ProvinceEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
