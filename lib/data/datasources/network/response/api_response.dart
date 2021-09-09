class ApiResponse {
  bool? status;
  String? message;

  ApiResponse.fromJson(Map<String, dynamic> json) {
    try {
      status = json['status'];
      message = json['message'];
    } catch (e) {}
  }

  bool isOK() {
    return status??false;
  }

  @override
  String toString() {
    return 'ApiResponse{status: $status, message: $message}';
  }
}