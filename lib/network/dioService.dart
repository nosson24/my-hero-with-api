import 'package:dio/dio.dart';

class DioService {
 

  static const baseUrl = 'http://103.13.31.37:40017/api/';
  
  static Future<Dio> getTmsApiDio() async {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 90000,
      receiveTimeout: 90000,
    );
    Dio dio = Dio(options);
    
    return dio;
  }


}

class DioWhatNewService {

  static const baseUrl = 'https://mocki.io/v1/';
  
  static Future<Dio> getTmsApiDio() async {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 90000,
      receiveTimeout: 90000,
    );
    Dio dio = Dio(options);
    
    return dio;
  }


}