class ChangePasswordRequest {
  String email;
  String oldPassword;
  String newPassword;

  ChangePasswordRequest({
    required this.email,
    required this.oldPassword,
    required this.newPassword,
  });

  // Method to convert the object into a JSON-compatible map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['oldpassword'] = oldPassword;
    data['newpassword'] = newPassword;

    return data;
  }
}
