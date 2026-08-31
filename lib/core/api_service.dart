import 'package:dio/dio.dart';
import 'package:e_commerce_nti_project/core/utils/constant_app.dart';

class ApiService {
  final Dio dio;
  ApiService({required this.dio}) {
    dio.options = BaseOptions(
      baseUrl: AppConstant.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    dio.interceptors.addAll([LogInterceptor()]);
  }
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    var response = await dio.post(
      endPoint,
      data: data,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getData({
    required String endPoint,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await dio.get(
      endPoint,
      options: Options(headers: headers),
    );
    return response.data;
  }
}
