part of 'inquiry_cubit.dart';

@immutable
sealed class InquiryState {}

final class InquiryInitial extends InquiryState {}

final class InquirymediaUploadSuccess extends InquiryState {}

final class InquirySubmitting extends InquiryState {}

final class InquirySubmittingSuccess extends InquiryState {}

final class InquirySubmittingFailed extends InquiryState {}
