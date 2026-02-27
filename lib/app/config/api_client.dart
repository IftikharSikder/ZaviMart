import 'package:dio/dio.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/core/utils/api_error_handler.dart';

class ApiClient {
  final Map<String, dynamic> headers = {"Content-Type": "application/json"};

  Future<dynamic> post({required dynamic postBody, required String endPoint}) async {
    Dio dio = Dio();
    Response response = await dio.post(
      AppConstants.baseURl + endPoint,
      data: postBody,
      options: Options(headers: headers),
    );

    if (response.statusCode == 201) {
      print("==========> status code: ${response.statusCode}");
      return null;
    } else {
      return ApiErrorHandler.getMessage(response.statusCode);
    }
  }
}
