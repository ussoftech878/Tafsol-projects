// ignore_for_file: constant_identifier_names

import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/controllers/signup_on_boarding_controller.dart';
import 'package:wabisabi_mob_app/models/requests/questions_attempted_request.dart';
import 'package:wabisabi_mob_app/models/requests/user_details_request.dart';
import 'package:wabisabi_mob_app/models/response/question_response.dart';
import 'package:wabisabi_mob_app/models/response/user_details_response.dart';
import 'package:wabisabi_mob_app/services/user_services.dart';
import 'package:wabisabi_mob_app/utils/custom_print.dart';
import 'package:wabisabi_mob_app/utils/custom_snackbar.dart';
import '../services/auth_services.dart';

class KycOnBoardingController extends GetxController {
  var currentIndex = 0.obs;
  late PageController pageController;
  RxString selectedCountry = ''.obs;
  RxString selectedCountry2 = ''.obs;
  File? _selectedImage;
  File? _capturedImage;
  File? get capturedImage => _capturedImage;
  UserServices _userServices = UserServices();
  Rx<UserDetailsResponse> _userDetailsResponse = UserDetailsResponse().obs;
  Rx<QuestionsResponse> _questionsResponse = QuestionsResponse().obs;

  //----------------getter and setters-------------------

  void setuserDetails(UserDetailsResponse userDetailsResponse) {
    _userDetailsResponse.value = userDetailsResponse;
  }

  void setquestions(QuestionsResponse questionsResponse) {
    _questionsResponse.value = questionsResponse;
  }

  UserDetailsResponse get userDetailsResponse => _userDetailsResponse.value;
  QuestionsResponse get questionsResponse => _questionsResponse.value;
  File? get selectedImage => _selectedImage;

  @override
  void onInit() async {
    GetUserDetails();
    GetQuestions();
    pageController = PageController();
    super.onInit();
  }

  Future<void> captureImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(
        source: ImageSource.camera, // Always open the camera
      );

      if (photo != null) {
        // Update the captured image
        _capturedImage = File(photo.path);
        print('Image captured: ${_capturedImage!.path}');
      } else {
        print('User canceled the camera');
      }
    } catch (e) {
      print('Error capturing image: $e');
    }
  }

  Future<void> pickImageFromFileExplorer() async {
    try {
      // Open the file picker and restrict selection to image files
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png'], // Restrict to image files
      );

      if (result != null) {
        _selectedImage = File(result.files.first.path!);
        print('Image picked: ${_selectedImage!.path}');
      } else {
        print('User canceled the file picker');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void resetImage() {
    _capturedImage = null;
  }

  Future<bool> setControllerValues() {
    if (userDetailsResponse.isSuccess == true) {
      // Safely set text fields using null-aware operators

      pageController = PageController(
          initialPage: userDetailsResponse.user?.pageIndex?.toInt() ?? 0);

      currentIndex = userDetailsResponse.user?.pageIndex?.obs ?? 0.obs;

      // Convert date to formatted string if needed
      dateController.text =
          userDetailsResponse.user?.dateOfBirth?.toString() ?? '';

      placeOfBirthController.text =
          userDetailsResponse.user?.placeOfBirth?.toString() ?? '';
      selectedCountry.value =
          userDetailsResponse.user?.nationality.toString() ?? 'Nationality';
      nIFController.text = userDetailsResponse.user?.nif?.toString() ?? '';

      selectedCountry2.value =
          userDetailsResponse.user?.country.toString() ?? 'Country';
      cityController.text = userDetailsResponse.user?.city?.toString() ?? '';
      streetNumberController.text =
          userDetailsResponse.user?.street?.toString() ?? '';
      postalCodeController.text =
          userDetailsResponse.user?.postalCode?.toString() ?? '';
      selectedValue.value =
          userDetailsResponse.user!.occupation!.toString().isEmpty
              ? 'Occupation / economic activity'
              : userDetailsResponse.user!.occupation!.toString();

      nameOfEmployerController.text =
          userDetailsResponse.user?.company?.toString() ?? 'Name of employer';
      selectedValue2.value =
          userDetailsResponse.user!.estimatedIncome!.toString().isEmpty
              ? 'Estimated annual income'
              : userDetailsResponse.user!.estimatedIncome!.toString();

      sourceOfFundController.text =
          userDetailsResponse.user?.sourceOfFunds?.toString() ?? '';

      selectedCharacter.value = SingingCharacter.Yes;
      selectedCharacter2.value = SingingCharacter2.Yes;
      provinceController.text =
          userDetailsResponse.user?.province?.toString() ?? '';

      return Future.value(true);
    }
    return Future.value(false);
  }

  void setSelectedCountry(String country) {
    selectedCountry.value = country;
  }

  void setSelectedCountry2(String country) {
    selectedCountry2.value = country;
  }

  void nextPage() {
    if (currentIndex.value < 5) {
      currentIndex.value++;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Get.toNamed(WelcomeScreen.routeName);
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToLast() {
    currentIndex.value = 2;
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  //-------------------------------financial screen states-------------------------------------------------
  //first dropdown
  var selectedValue = Rxn<String>("Occupation / economic activity");
  final List<String> items = [
    'Occupation / economic activity',
    'option 2',
    'option 3',
    'option 4'
  ];

  void updateSelectedValue(String? value) {
    selectedValue.value = value;
  }

  //second drop down
  var selectedValue2 = Rxn<String>("Estimated annual income");
  final List<String> items2 = [
    'Estimated annual income',
    '\$0-\$25K',
    '\$25K-\$50K',
    'others'
  ];

  void updateSelectedValue2(String? value2) {
    selectedValue2.value = value2;
  }

//-------------------------------declaartion and confirmations screen states-------------------------------------------------

  var selectedCharacter = SingingCharacter.Yes.obs;

  void updateSelectedCharacter(SingingCharacter character) {
    selectedCharacter.value = character;
  }

  var selectedCharacter2 = SingingCharacter2.Yes.obs;

  void updateSelectedCharacter2(SingingCharacter2 character2) {
    selectedCharacter2.value = character2;
  }

  // Define text controllers

  final dateController = TextEditingController();
  final placeOfBirthController = TextEditingController();
  final nationalityController = TextEditingController();
  final nIFController = TextEditingController();
  final streetNumberController = TextEditingController();
  final postalCodeController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final provinceController = TextEditingController();
  final nameOfEmployerController = TextEditingController();
  //final emailController = TextEditingController();
  final sourceOfFundController = TextEditingController();
  final iBANController = TextEditingController();
  final nameOfBankController = TextEditingController();
  final swiftcodeController = TextEditingController();

  @override
  void onClose() {
    pageController.dispose();
    dateController.dispose();
    swiftcodeController.dispose();
    placeOfBirthController.dispose();
    nationalityController.dispose();
    nIFController.dispose();
    streetNumberController.dispose();
    postalCodeController.dispose();
    provinceController.dispose();
    cityController.dispose();
    countryController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    nameOfEmployerController.dispose();
    sourceOfFundController.dispose();
    iBANController.dispose();
    nameOfBankController.dispose();
    super.onClose();
  }

  //--------------------------------- api calling ---------------------

  Future<bool> GetQuestions() async {
    EasyLoading.show(status: 'loading...');

    try {
      final response = await _userServices.getquestions();

      if (response.isSuccess!) {
        setquestions(response);
        debugPrint(response.message.toString());
        ColoredPrint.yellow(response.questions.toString());
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

  Future<bool> PostQuestions() async {
    EasyLoading.show(status: 'loading...');

    try {
      final List<QuestionsAttemptedRequest> request = [
        QuestionsAttemptedRequest(
            QuestionID: questionsResponse.questions![0].iD!,
            SelectedOption: selectedCharacter.value.toString()),
        QuestionsAttemptedRequest(
            QuestionID: questionsResponse.questions![1].iD!,
            SelectedOption: selectedCharacter2.value.toString()),
      ];

      final response = await _userServices.PostQuestion(request);

      if (response.isSuccess!) {
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

  Future<bool> GetUserDetails() async {
    EasyLoading.show(status: 'loading...');
    try {
      final response = await _userServices.getuserDetails();

      if (response.isSuccess!) {
        setuserDetails(response);
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

  Future<bool> UpdateUserDetails() async {
    EasyLoading.show(status: 'loading...');
    try {
      final response = await _userServices.UpdateuserDetails(UserDetailsRequest(
          //email: emailController.text,
          date_ofBirth: dateController.text,
          nationality: selectedCountry.value.toString(),
          province: provinceController.text,
          placeOfBirth: placeOfBirthController.text,
          //account_number: iBANController.text,
          //swift_bic_code: swiftcodeController.text,
          //politically_exposed_person: selectedCharacter.value.toString(),
          //tax_residency: selectedCharacter2.value.toString(),
          nif: nIFController.text,
          street: streetNumberController.text,
          postalCode: postalCodeController.text,
          city: cityController.text,
          country: selectedCountry2.value.toString(),
          occupation: selectedValue.value.toString(),
          company: nameOfEmployerController.text,
          estimatedIncome: selectedValue2.value.toString(),
          sourceOfFunds: sourceOfFundController.text,
          pageIndex: pageController.page!.toInt() < 5
              ? pageController.page!.toInt() + 1
              : pageController.page!.toInt()));
      if (response.isSuccess!) {
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

enum SingingCharacter { Yes, No }

enum SingingCharacter2 { Yes, No }
