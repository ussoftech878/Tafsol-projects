import 'package:wabisabi_mob_app/models/response/base_response_model.dart';

class BeneficiaryDetailsResponseModel extends BaseResponseModel {
  Beneficiary? beneficiaryDetails;

  // Constructor
  BeneficiaryDetailsResponseModel({
    this.beneficiaryDetails,
    bool? isSuccess,
    String? message,
  }) : super(isSuccess: isSuccess, message: message);

  // Factory method to parse JSON into a BeneficiaryDetailsResponseModel object
  factory BeneficiaryDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    // Parse base fields (isSuccess, message)
    BaseResponseModel base = BaseResponseModel.fromJson(json);

    // Parse beneficiary details
    Beneficiary? beneficiaryDetails;
    if (json['beneficiary_details'] != null) {
      beneficiaryDetails = Beneficiary.fromJson(
          json['beneficiary_details'] as Map<String, dynamic>);
    }

    // Return the constructed object
    return BeneficiaryDetailsResponseModel(
      beneficiaryDetails: beneficiaryDetails,
      isSuccess: base.isSuccess,
      message: base.message,
    );
  }

  // Method to convert the object back to JSON
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.beneficiaryDetails != null) {
      data['beneficiary_details'] = this.beneficiaryDetails!.toJson();
    }
    return data;
  }
}

class Beneficiary {
  int? beneficiaryId;
  String? name;
  String? wsId;
  String? walletId;

  Beneficiary({
    this.beneficiaryId,
    this.name,
    this.wsId,
    this.walletId,
  });

  // Factory method to parse JSON into a Beneficiary object
  factory Beneficiary.fromJson(Map<String, dynamic> json) {
    return Beneficiary(
      beneficiaryId: json['beneficiary_id'] as int?,
      name: json['name'] as String?,
      wsId: json['ws_id'] as String?,
      walletId: json['wallet_id'] as String?,
    );
  }

  // Method to convert the object back to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['beneficiary_id'] = this.beneficiaryId;
    data['name'] = this.name;
    data['ws_id'] = this.wsId;
    data['wallet_id'] = this.walletId;
    return data;
  }
}
