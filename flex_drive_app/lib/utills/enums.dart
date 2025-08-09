import 'package:flexdrive/models/requests/forgot_password_request.dart';


enum EndPoints {
  signIn('/api/v1/auth/login'),
  verifyOtp("/api/v1/auth/verify/otp"),
  forgotPassword("/api/v1/auth/forgot/password"),
  resetPassword("/api/v1/auth/reset/password"),
  resendopt("/api/v1/auth/resend/otp"),
  updatePassword("/api/v1/auth/update/password"),
  getMyBooking("/api/v1/bookings/all"),
  getBookingDetail("/api/v1/bookings/"),
  getMyProfile("/api/v1/users/me"),
  logOut("/api/v1/auth/logout");

  final String url;

  const EndPoints(this.url);
}

String s3Bucket = "https://envite-bucket.s3.me-central-1.amazonaws.com/";

enum Shared_pref_enum {
  authToken("auth_token");

  final String value;

  const Shared_pref_enum(this.value);
}
