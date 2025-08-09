import 'package:wabisabi_mob_app/models/response/base_response_model.dart';

class BeneficiaryResponseModel extends BaseResponseModel {
  List<Beneficiary>? beneficiaries;

  // Constructor
  BeneficiaryResponseModel({
    this.beneficiaries,
    bool? isSuccess,
    String? message,
  }) : super(isSuccess: isSuccess, message: message);

  // Factory method to parse JSON into a BeneficiaryResponseModel object
  factory BeneficiaryResponseModel.fromJson(Map<String, dynamic> json) {
    // Parse base fields (isSuccess, message)
    BaseResponseModel base = BaseResponseModel.fromJson(json);

    // Parse beneficiaries list
    List<Beneficiary>? beneficiariesList;
    if (json['beneficiaries'] != null) {
      beneficiariesList = (json['beneficiaries'] as List)
          .map((item) => Beneficiary.fromJson(item))
          .toList();
    }

    // Return the constructed object
    return BeneficiaryResponseModel(
      beneficiaries: beneficiariesList,
      isSuccess: base.isSuccess,
      message: base.message,
    );
  }

  // Method to convert the object back to JSON

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message; // Inherit from BaseResponseModel
    if (this.beneficiaries != null) {
      data['beneficiaries'] =
          this.beneficiaries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Beneficiary {
  String? beneficiaryId;
  String? beneficiaryName;
  String? walletNumber;
  bool? isFav;
  bool? isFriend;
  bool? isFamily;

  Beneficiary(
      {this.beneficiaryId,
      this.beneficiaryName,
      this.walletNumber,
      this.isFav,
      this.isFriend,
      this.isFamily});

  Beneficiary.fromJson(Map<String, dynamic> json) {
    beneficiaryId = json['beneficiary_id'];
    beneficiaryName = json['beneficiary_name'];
    walletNumber = json['wallet_number'];
    isFav = json['is_fav'];
    isFriend = json['is_friend'];
    isFamily = json['is_family'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['beneficiary_id'] = this.beneficiaryId;
    data['beneficiary_name'] = this.beneficiaryName;
    data['wallet_number'] = this.walletNumber;
    data['is_fav'] = this.isFav;
    data['is_friend'] = this.isFriend;
    data['is_family'] = this.isFamily;
    return data;
  }
}
