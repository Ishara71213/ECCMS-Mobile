import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OfficerUserEntity extends Equatable {
  final String? disability;
  final String? emergencyContact;
  final String? emergencyContactName;
  final String? recidenceAddress;
  final LatLng? recidenceCordinate;
  final String? guardianId;
  final bool isAllowedLivelocationShare;

  const OfficerUserEntity(
      {this.disability,
      this.emergencyContact,
      this.emergencyContactName,
      this.recidenceAddress,
      this.recidenceCordinate,
      this.guardianId,
      this.isAllowedLivelocationShare = false});

  @override
  List<Object?> get props => [
        disability,
        emergencyContact,
        emergencyContactName,
        recidenceAddress,
        recidenceCordinate,
        guardianId,
        isAllowedLivelocationShare
      ];
}
