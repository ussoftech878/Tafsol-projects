class SignInRequest {
  String email;
  String password;

  SignInRequest({
    required this.email,
    required this.password,

    /*this.role*/
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;

    return data;
  }
}
