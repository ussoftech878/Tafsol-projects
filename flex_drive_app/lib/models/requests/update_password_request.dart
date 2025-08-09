class UpdatePasswordRequest {
  String currentPassword;
  String password;
  String confirmPassword;

  UpdatePasswordRequest({
    required this.currentPassword,
    required this.password,
    required this.confirmPassword,

    /*this.role*/
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["currentPassword"] = currentPassword;
    data["password"] = password;
    data["confirmPassword"] = confirmPassword;

    return data;
  }
}
