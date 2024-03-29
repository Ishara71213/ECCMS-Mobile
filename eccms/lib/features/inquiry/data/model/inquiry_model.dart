import 'package:eccms/features/inquiry/domain/entities/inquiry_entity.dart';

class InquiryModel extends InquiryEntity {
  const InquiryModel({
    required int? id,
    required int? userId,
    required int? employeeId,
    required int? branchId,
    required int? institutionId,
    required int? crimeTypeId,
    required String? crimeTypeName,
    required String? ticketId,
    required int? status,
    required String? inquiryEntry,
    required String? userAttachment,
    required String? reviewingResponse,
    required String? assignResponse,
    required String? investigatingResponse,
    required String? investigatingAttachment,
    required String? completeResponse,
    required String? userComment,
    required bool? isSatisfied,
    required int? rating,
  }) : super(
          id: id,
          userId: userId,
          employeeId: employeeId,
          branchId: branchId,
          institutionId: institutionId,
          crimeTypeId: crimeTypeId,
          crimeTypeName: crimeTypeName,
          ticketId: ticketId,
          status: status,
          inquiryEntry: inquiryEntry,
          userAttachment: userAttachment,
          reviewingResponse: reviewingResponse,
          assignResponse: assignResponse,
          investigatingResponse: investigatingResponse,
          investigatingAttachment: investigatingAttachment,
          completeResponse: completeResponse,
          userComment: userComment,
          isSatisfied: isSatisfied,
          rating: rating,
        );

  factory InquiryModel.fromJson(Map<String, dynamic> json) {
    return InquiryModel(
      id: json['id'],
      userId: json['userId'],
      employeeId: json['employeeId'],
      branchId: json['branchId'],
      institutionId: json['institutionId'],
      crimeTypeId: json['crimeTypeId'],
      crimeTypeName: json['crimeTypeName'],
      ticketId: json['ticketId'],
      status: json['status'],
      inquiryEntry: json['inquiryEntry'],
      userAttachment: json['userAttachment'],
      reviewingResponse: json['reviewingResponse'],
      assignResponse: json['assignResponse'],
      investigatingResponse: json['investigatingResponse'],
      investigatingAttachment: json['investigatingAttachment'],
      completeResponse: json['completeResponse'],
      userComment: json['userComment'],
      isSatisfied: json['isSatisfied'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'employeeId': employeeId,
      'branchId': branchId,
      'institutionId': institutionId,
      'crimeTypeId': crimeTypeId,
      'crimeTypeName': crimeTypeName,
      'ticketId': ticketId,
      'status': status,
      'inquiryEntry': inquiryEntry,
      'userAttachment': userAttachment,
      'reviewingResponse': reviewingResponse,
      'assignResponse': assignResponse,
      'investigatingResponse': investigatingResponse,
      'investigatingAttachment': investigatingAttachment,
      'completeResponse': completeResponse,
      'userComment': userComment,
      'isSatisfied': isSatisfied,
      'rating': rating,
    };
  }

  factory InquiryModel.fromEntity(InquiryEntity entity) {
    return InquiryModel(
      id: entity.id,
      userId: entity.userId,
      employeeId: entity.employeeId,
      branchId: entity.branchId,
      institutionId: entity.institutionId,
      crimeTypeId: entity.crimeTypeId,
      crimeTypeName: entity.crimeTypeName,
      ticketId: entity.ticketId,
      status: entity.status,
      inquiryEntry: entity.inquiryEntry,
      userAttachment: entity.userAttachment,
      reviewingResponse: entity.reviewingResponse,
      assignResponse: entity.assignResponse,
      investigatingResponse: entity.investigatingResponse,
      investigatingAttachment: entity.investigatingAttachment,
      completeResponse: entity.completeResponse,
      userComment: entity.userComment,
      isSatisfied: entity.isSatisfied,
      rating: entity.rating,
    );
  }

  Map<String, dynamic> toJsonPostInquiry() {
    return {
      "userId": userId,
      "institutionId": institutionId,
      "branchId": branchId,
      "crimeTypeId": crimeTypeId,
      "status": status,
      "inquiryEntry": inquiryEntry,
      "userAttachment": userAttachment,
    };
  }
}
