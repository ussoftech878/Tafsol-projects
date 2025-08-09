
class BaseResponseModel {
  bool? isSuccess;
  String? message;

  BaseResponseModel({
    this.isSuccess,
    this.message,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return BaseResponseModel(
      isSuccess: json['isSuccess'],
      message: json['message'],
    );
  }
}
