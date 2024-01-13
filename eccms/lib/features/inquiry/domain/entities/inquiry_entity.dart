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
    this.id,
    this.userId,
    this.employeeId,
    this.branchId,
    this.institutionId,
    this.crimeTypeId,
    this.crimeTypeName,
    this.ticketId,
    this.status,
    this.inquiryEntry,
    this.userAttachment,
    this.reviewingResponse,
    this.assignResponse,
    this.investigatingResponse,
    this.investigatingAttachment,
    this.completeResponse,
    this.userComment,
    this.isSatisfied,
    this.rating,
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
