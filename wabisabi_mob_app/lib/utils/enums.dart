enum SharedPreferencesKeys {
  authToken("auth_token");

  const SharedPreferencesKeys(this.text);

  final String text;
}

enum EndPoints {
  register("auth/register"),
  login("auth/login"),
  forgotPassword("forgetPassword"),
  resetPassword("resetPassword"),
  verifyOTP("verifyOTP"),
  resendOtp("resendOTP"),
  setBankDetails("ws/setBankDetails"),
  insertQuesAttempt("ws/insertQuesAttempt"),
  validateWSID("ws/validateWSID"),
  validateEmail("auth/validateEmail"),
  setIdPin("ws/setIdPin"),
  updatePhoneNumber("ws/updatePhoneNumber"),
  userDetails("ws/getUserDetails"),
  updateUser("ws/userDetails"),
  getBeneficiary("ws/getBeneficiary"),
  getBeneficiaryDetails("ws/getBeneficiaryDetails/"),
  getQuestions("ws/getQuestions"),
  postQuestions("ws/insertQuesAttempt"),
  changePassword("ws/changePassword");

  final String url;

  const EndPoints(this.url);
}

enum BaseUrls {
  prodUrl("https://ws-pay-test.devcustomprojects.com/api/"),
  stagUrl("https://gj2h0qqn-3029.inc1.devtunnels.ms/api/v1/"),

  s3Url("https://envite-bucket.s3.me-central-1.amazonaws.com/");

  final String url;

  const BaseUrls(this.url);
}
