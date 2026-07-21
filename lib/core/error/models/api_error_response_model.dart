import 'package:store_app/core/error/models/error_details_model.dart';

class ApiErrorResponseModel {
  final String? statusMsg;
  final String? message;
  final ErrorDetailsModel? errors;

  const ApiErrorResponseModel({
    this.statusMsg,
    this.message,
    this.errors,
  });

  factory ApiErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponseModel(
      statusMsg: json['statusMsg'],
      message: json['message'],
      errors: json['errors'] != null
          ? ErrorDetailsModel.fromJson(json['errors'])
          : null,
    );
  }
}