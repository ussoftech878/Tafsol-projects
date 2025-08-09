import 'package:flexdrive/models/response/base_response_model.dart';

class UpdatePasswordResponse extends BaseResponseModel {
  Data? data;

  UpdatePasswordResponse({super.status, this.data});

  UpdatePasswordResponse.fromJson(Map<String, dynamic> json) {
    BaseResponseModel base = BaseResponseModel.fromJson(json);
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = base.status;
    message = base.message;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }
}

class User {
  String? sId;
  String? slug;
  String? slugId;
  String? fullName;
  String? photo;
  String? email;
  String? phoneNumber;
  Wallet? wallet;
  String? role;
  List<String>? fcmToken;
  List<String>? socketIds;
  String? cus;
  bool? isActive;
  bool? isOnline;
  bool? isVerified;
  String? kycVerificationStatus;
  bool? isBlockedByAdmin;
  String? address;
  bool? isDeleted;
  String? stripeAccountId;
  bool? stripeAccountStatus;
  List<String>? uniqueSocketIds;
  String? lastLogin;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? passwordChangedAt;
  bool? isEmailVerified;
  String? loginAt;
  bool? creditStatus;
  bool? driverLicenseStatus;

  User(
      {this.sId,
      this.slug,
      this.slugId,
      this.fullName,
      this.photo,
      this.email,
      this.phoneNumber,
      this.wallet,
      this.role,
      this.fcmToken,
      this.socketIds,
      this.cus,
      this.isActive,
      this.isOnline,
      this.isVerified,
      this.kycVerificationStatus,
      this.isBlockedByAdmin,
      this.address,
      this.isDeleted,
      this.stripeAccountId,
      this.stripeAccountStatus,
      this.uniqueSocketIds,
      this.lastLogin,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.passwordChangedAt,
      this.isEmailVerified,
      this.loginAt,
      this.creditStatus,
      this.driverLicenseStatus});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    fullName = json['fullName'];
    photo = json['photo'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    wallet =
        json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
    role = json['role'];
    fcmToken = json['fcmToken'].cast<String>();
    socketIds = json['socketIds'].cast<String>();
    cus = json['cus'];
    isActive = json['isActive'];
    isOnline = json['isOnline'];
    isVerified = json['isVerified'];
    kycVerificationStatus = json['kycVerificationStatus'];
    isBlockedByAdmin = json['isBlockedByAdmin'];
    address = json['address'];
    isDeleted = json['isDeleted'];
    stripeAccountId = json['stripeAccountId'];
    stripeAccountStatus = json['stripeAccountStatus'];
    uniqueSocketIds = json['uniqueSocketIds'].cast<String>();
    lastLogin = json['lastLogin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    passwordChangedAt = json['passwordChangedAt'];
    isEmailVerified = json['isEmailVerified'];
    loginAt = json['loginAt'];
    creditStatus = json['creditStatus'];
    driverLicenseStatus = json['driverLicenseStatus'];
  }
}

class Wallet {
  int? totalEarnings;
  String? sId;
  String? createdAt;
  String? updatedAt;

  Wallet({this.totalEarnings, this.sId, this.createdAt, this.updatedAt});

  Wallet.fromJson(Map<String, dynamic> json) {
    totalEarnings = json['totalEarnings'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
