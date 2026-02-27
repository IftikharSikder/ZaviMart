class ApiErrorHandler {
  static String getMessage(int? statusCode) {
    switch (statusCode) {
      case 201:
        return "Login Successful.";
      case 400:
        return "Successfully Created.";
      case 401:
        return "Invalid username or password.";
      default:
        return "Something went wrong.";
    }
  }
}
