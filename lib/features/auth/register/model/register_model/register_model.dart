class RegisterResponse {
  final String? status;
  final String? message;
  final Map<String, dynamic>? errors;

  RegisterResponse({this.status, this.message, this.errors});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      status: json['status'],
      message: json['message'],
      errors: json['errors'],
    );
  }
}
