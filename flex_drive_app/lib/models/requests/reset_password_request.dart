class ResetPasswordRequest {
  String email;
  String password;
  String confirmPassword;
  String code;

  ResetPasswordRequest({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.code,

    /*this.role*/
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    data['code'] = code;

    return data;
  }
}
