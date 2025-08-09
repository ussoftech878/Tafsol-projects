import 'package:flexdrive/models/response/base_response_model.dart';
import 'package:flexdrive/utills/enums.dart';
import 'package:http/http.dart';

class GetMyProfileModel extends BaseResponseModel {
  User? user;

  GetMyProfileModel({super.status, super.message, this.user});

  GetMyProfileModel.fromJson(Map<String, dynamic> json) {
    BaseResponseModel base = BaseResponseModel.fromJson(json);
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    status = base.status;
    message = base.message;
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
  bool? driverLicenseStatus;
  bool? creditStatus;
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
  String? loginAt;
  String? passwordChangedAt;

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
      this.driverLicenseStatus,
      this.creditStatus,
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
      this.loginAt,
      this.passwordChangedAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    fullName = json['fullName'];
    if (json["photo"] != null) {
      photo = s3Bucket + json['photo'];
    }

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
    driverLicenseStatus = json['driverLicenseStatus'];
    creditStatus = json['creditStatus'];
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
    loginAt = json['loginAt'];
    passwordChangedAt = json['passwordChangedAt'];
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
