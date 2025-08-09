// ignore_for_file: unnecessafer_collection_literals

import 'package:wabisabi_mob_app/models/response/base_response_model.dart';

class UserDetailsResponse extends BaseResponseModel {
  User? user;

  UserDetailsResponse({this.user, bool? isSuccess, String? message})
      : super(isSuccess: isSuccess, message: message);

  UserDetailsResponse.fromJson(Map<String, dynamic> json) {
    BaseResponseModel base = BaseResponseModel.fromJson(json);
    user = json['User'] != null ? User.fromJson(json['User']) : null;
    isSuccess = base.isSuccess;
    message = base.message;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? email;
  String? dateOfBirth;
  String? nationality;
  String? placeOfBirth;
  String? nif;
  String? street;
  String? province;
  String? postalCode;
  String? city;
  String? country;
  String? occupation;
  String? company;
  String? estimatedIncome;
  String? sourceOfFunds;
  String? nicUrlFront;
  String? nicUrlBack;
  int? pageIndex;

  User(
      {this.email,
      this.dateOfBirth,
      this.nationality,
      this.placeOfBirth,
      this.nif,
      this.street,
      this.province,
      this.postalCode,
      this.city,
      this.country,
      this.occupation,
      this.company,
      this.estimatedIncome,
      this.sourceOfFunds,
      this.nicUrlFront,
      this.nicUrlBack,
      this.pageIndex});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    dateOfBirth = json['date_of_birth'];
    nationality = json['nationality'];
    placeOfBirth = json['place_of_birth'];
    nif = json['nif'];
    street = json['street'];
    province = json['province'];
    postalCode = json['postal_code'];
    city = json['city'];
    country = json['country'];
    occupation = json['occupation'];
    company = json['company'];
    estimatedIncome = json['estimated_income'];
    sourceOfFunds = json['source_of_funds'];
    nicUrlFront = json['nic_url_front'];
    nicUrlBack = json['nic_url_back'];
    pageIndex = json['page_index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['date_of_birth'] = this.dateOfBirth;
    data['nationality'] = this.nationality;
    data['place_of_birth'] = this.placeOfBirth;
    data['nif'] = this.nif;
    data['street'] = this.street;
    data['province'] = this.province;
    data['postal_code'] = this.postalCode;
    data['city'] = this.city;
    data['country'] = this.country;
    data['occupation'] = this.occupation;
    data['company'] = this.company;
    data['estimated_income'] = this.estimatedIncome;
    data['source_of_funds'] = this.sourceOfFunds;
    data['nic_url_front'] = this.nicUrlFront;
    data['nic_url_back'] = this.nicUrlBack;
    data['page_index'] = this.pageIndex;
    return data;
  }
}
