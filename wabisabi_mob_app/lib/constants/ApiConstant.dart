class ApiConstants {
  static const baseUrl = "https://ws-pay-test.devcustomprojects.com/";

  static const register = "${baseUrl}auth/register";
  static const login = "${baseUrl}auth/login";
  static const forgotPassword = "${baseUrl}forgetPassword";
  static const resetPassword = "${baseUrl}resetPassword";
  static const verifyOTP = "${baseUrl}verifyOTP";

  static const setBankDetails = "${baseUrl}ws/setBankDetails";
  static const insertQuesAttempt = "${baseUrl}ws/insertQuesAttempt";
  static const validateWSID = "${baseUrl}ws/validateWSID";
  static const validateEmail = "${baseUrl}auth/validateEmail";
  static const setIdPin = "${baseUrl}ws/setIdPin";
  static const updatePhoneNumber = "${baseUrl}ws/updatePhoneNumber";
  static const userDetails = "${baseUrl}ws/userDetails";
  static const getQuestions = "${baseUrl}ws/getQuestions";
}
