import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/models/response/Beneficiary_response_model.dart';
import 'package:wabisabi_mob_app/models/response/beneficiary_details_response_model.dart';
import 'package:wabisabi_mob_app/services/user_services.dart';
import 'package:wabisabi_mob_app/utils/custom_print.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await GetBeneficiary();
  }

  RxString selectedCategory = 'Family'.obs;
  UserServices _userServices = UserServices();
  Rx<BeneficiaryResponseModel> _beneficiaryResponse =
      BeneficiaryResponseModel().obs;
  Rx<BeneficiaryDetailsResponseModel> _beneficiaryDetailsResponse =
      BeneficiaryDetailsResponseModel().obs;

  // Getter and setter
  void setbeneficiary(BeneficiaryResponseModel beneficiaryResponse) {
    _beneficiaryResponse.value = beneficiaryResponse;
  }

  void setBeneficiaryDetails(BeneficiaryDetailsResponseModel detailsResponse) {
    _beneficiaryDetailsResponse.value = detailsResponse;
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  BeneficiaryResponseModel get beneficiaryResponse =>
      _beneficiaryResponse.value;
  BeneficiaryDetailsResponseModel get beneficiaryDetailsResponse =>
      _beneficiaryDetailsResponse.value;

  Future<bool> GetBeneficiaryDetails(String beneficiary_id) async {
    EasyLoading.show(status: 'loading...');

    try {
      final response =
          await _userServices.getBeneficiaryDetails(beneficiary_id);

      if (response.isSuccess!) {
        setBeneficiaryDetails(response);

        debugPrint(response.message.toString());
        return true;
      } else {
        EasyLoading.showError(response.message.toString());
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<bool> GetBeneficiary() async {
    //EasyLoading.show(status: 'loading...');

    try {
      final response = await _userServices.getBeneficiary();

      if (response.isSuccess!) {
        setbeneficiary(response);
        debugPrint(response.message.toString());
        return true;
      } else {
        EasyLoading.showError(response.message.toString());
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    } finally {
      EasyLoading.dismiss();
    }
  }
}
