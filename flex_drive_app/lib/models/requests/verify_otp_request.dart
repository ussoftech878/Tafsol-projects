class VerifyOtpRequest {
  String email;
  String code;
  bool fromForgotPassword;

  VerifyOtpRequest({
    required this.email,
    required this.code,
    required this.fromForgotPassword,

    /*this.role*/
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['code'] = code;
    data['fromForgotPassword'] = fromForgotPassword;

    return data;
  }
}
