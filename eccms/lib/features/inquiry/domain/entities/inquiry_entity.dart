import 'package:equatable/equatable.dart';

class InquiryEntity extends Equatable {
  final int? id;
  final int? userId;
  final int? employeeId;
  final int? branchId;
  final int? institutionId;
  final int? crimeTypeId;
  final String? crimeTypeName;
  final String? ticketId;
  final int? status;
  final String? inquiryEntry;
  final String? userAttachment;
  final String? reviewingResponse;
  final String? assignResponse;
  final String? investigatingResponse;
  final String? investigatingAttachment;
  final String? completeResponse;
  final String? userComment;
  final bool? isSatisfied;
  final int? rating;

  const InquiryEntity({
    required this.id,
    required this.userId,
    required this.employeeId,
    required this.branchId,
    required this.institutionId,
    required this.crimeTypeId,
    required this.crimeTypeName,
    required this.ticketId,
    required this.status,
    required this.inquiryEntry,
    required this.userAttachment,
    required this.reviewingResponse,
    required this.assignResponse,
    required this.investigatingResponse,
    required this.investigatingAttachment,
    required this.completeResponse,
    required this.userComment,
    required this.isSatisfied,
    required this.rating,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        employeeId,
        branchId,
        institutionId,
        crimeTypeId,
        crimeTypeName,
        ticketId,
        status,
        inquiryEntry,
        userAttachment,
        reviewingResponse,
        assignResponse,
        investigatingResponse,
        investigatingAttachment,
        completeResponse,
        userComment,
        isSatisfied,
        rating,
      ];
}
