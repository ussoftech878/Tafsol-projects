import 'package:get/get.dart' hide Response;
import 'package:wabisabi_mob_app/models/requests/change_password_request.dart';
import 'package:wabisabi_mob_app/models/requests/questions_attempted_request.dart';
import 'package:wabisabi_mob_app/models/requests/user_details_request.dart';
import 'package:wabisabi_mob_app/models/response/Beneficiary_response_model.dart';
import 'package:wabisabi_mob_app/models/response/base_response_model.dart';
import 'package:wabisabi_mob_app/models/response/beneficiary_details_response_model.dart';
import 'package:wabisabi_mob_app/models/response/question_response.dart';
import 'package:wabisabi_mob_app/models/response/user_details_response.dart';
import 'package:wabisabi_mob_app/services/api_base_helper.dart';
import 'package:wabisabi_mob_app/services/customPrint.dart';
import 'package:wabisabi_mob_app/utils/enums.dart';

class UserServices extends GetxService {
  ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  Future<UserDetailsResponse> getuserDetails() async {
    final response = await _apiBaseHelper.httpRequest(
      endpoint: EndPoints.userDetails,
      requestType: 'GET',
      params: '',
    );
    ColoredPrint.yellow(response.toString());
    UserDetailsResponse parseddata = UserDetailsResponse.fromJson(response);
    return parseddata;
  }

  Future<QuestionsResponse> getquestions() async {
    final response = await _apiBaseHelper.httpRequest(
      endpoint: EndPoints.getQuestions,
      requestType: 'GET',
      params: '',
    );
    ColoredPrint.yellow(response.toString());
    QuestionsResponse parseddata = QuestionsResponse.fromJson(response);
    return parseddata;
  }

  Future<BaseResponseModel> PostQuestion(
      List<QuestionsAttemptedRequest> request) async {
    final response = await _apiBaseHelper.httpRequest(
        endpoint: EndPoints.postQuestions,
        requestType: 'POST',
        params: '',
        requestBody: request);
    ColoredPrint.yellow(response.toString());
    BaseResponseModel parseddata = BaseResponseModel.fromJson(response);
    return parseddata;
  }

  Future<BaseResponseModel> UpdateuserDetails(
      UserDetailsRequest userdetailrequest) async {
    ColoredPrint.yellow(userdetailrequest.toJson().toString());
    final response = await _apiBaseHelper.httpRequest(
      endpoint: EndPoints.updateUser,
      requestType: 'PATCH',
      params: '',
      requestBody: userdetailrequest,
    );

    BaseResponseModel parseddata = BaseResponseModel.fromJson(response);
    return parseddata;
  }

  Future<BeneficiaryResponseModel> getBeneficiary() async {
    final response = await _apiBaseHelper.httpRequest(
      endpoint: EndPoints.getBeneficiary,
      requestType: 'GET',
      params: '',
    );

    BeneficiaryResponseModel parseddata =
        BeneficiaryResponseModel.fromJson(response);
    return parseddata;
  }

  Future<BeneficiaryDetailsResponseModel> getBeneficiaryDetails(
      String beneficiary_id) async {
    final response = await _apiBaseHelper.httpRequest(
      endpoint: EndPoints.getBeneficiaryDetails,
      requestType: 'GET',
      params: beneficiary_id,
    );
    ColoredPrint.yellow(response.toString());
    BeneficiaryDetailsResponseModel parseddata =
        BeneficiaryDetailsResponseModel.fromJson(response);
    return parseddata;
  }

  Future<BaseResponseModel> ChangePassword(
      ChangePasswordRequest changepasswordrequest) async {
    ColoredPrint.yellow(changepasswordrequest.toJson().toString());
    final response = await _apiBaseHelper.httpRequest(
        endpoint: EndPoints.changePassword,
        requestType: 'POST',
        params: "",
        requestBody: changepasswordrequest);

    BaseResponseModel parseddata = BaseResponseModel.fromJson(response);
    return parseddata;
  }
}
