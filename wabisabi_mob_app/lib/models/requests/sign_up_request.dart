class SignUpRequest {
  String email;
  String password;
  String firstname;
  String lastname;

  SignUpRequest({
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    /*this.role*/
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['first_name'] = firstname;
    data['last_name'] = lastname;

    return data;
  }
}
