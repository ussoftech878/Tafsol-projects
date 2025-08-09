class ResendOptRequest {
  String email;
  bool fromForgotPassword;

  ResendOptRequest({required this.email, this.fromForgotPassword = true});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data["fromForgotPassword"] = fromForgotPassword;

    return data;
  }
}
