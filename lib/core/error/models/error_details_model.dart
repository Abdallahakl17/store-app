class ErrorDetailsModel {
  final String? value;
  final String? msg;
  final String? param;
  final String? location;

  const ErrorDetailsModel({
    this.value,
    this.msg,
    this.param,
    this.location,
  });

  factory ErrorDetailsModel.fromJson(Map<String, dynamic> json) {
    return ErrorDetailsModel(
      value: json['value'],
      msg: json['msg'],
      param: json['param'],
      location: json['location'],
    );
  }
}