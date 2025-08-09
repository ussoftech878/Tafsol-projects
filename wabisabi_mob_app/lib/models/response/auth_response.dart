// ignore_for_file: unnecessafer_collection_literals

import 'package:wabisabi_mob_app/models/response/base_response_model.dart';

class AuthResponse extends BaseResponseModel {
  User? user;
  String? token;

  AuthResponse({this.user, this.token, bool? isSuccess, String? message})
      : super(isSuccess: isSuccess, message: message);

  AuthResponse.fromJson(Map<String, dynamic> json) {
    BaseResponseModel base = BaseResponseModel.fromJson(json);
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    isSuccess = base.isSuccess;
    message = base.message;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? createdAt;

  User({this.id, this.email, this.firstName, this.lastName, this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['created_at'] = this.createdAt;
    return data;
  }
}
