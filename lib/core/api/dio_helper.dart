import 'package:dio/dio.dart';
import 'package:slash_task/core/api/end_points.dart';

class DioHelper {
  final Dio dio;
  DioHelper({required this.dio}){
    dio.options
      ..baseUrl=EndPoints.baseUrl
      ..receiveDataWhenStatusError=true;
  }


  Future<Response> getData({
    required final String url,
    Map<String, dynamic>? query,
  })async {
    return await dio.get(url, queryParameters: query);
  }
}

// https://slash-backend.onrender.com/product
